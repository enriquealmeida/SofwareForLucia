/* Copyright (c) 1998, 2018, Oracle and/or its affiliates. 
All rights reserved.*/
/* 
   NAME 
     pen.h - PL/SQL Execute Native interfaces.

   DESCRIPTION 
     This file is the PRIMARY file defining the interfaces between native code 
     and the rest of the runtime system.

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
     <other useful comments, qualifications, etc.>

   MODIFIED   (MM/DD/YY)
   astocks     07/22/18 - 28375836: Tidy up sleeping beauties
   jolkin      02/25/17 - proj 68493: fix primary key
   jolkin      01/18/17 - proj 68493: direct memoptimized reads
   traney      05/29/14 - 9560745: remove c native peiebar references
   sylin       07/22/13 - Add PEN_MOVRPAT
   dbronnik    02/18/11 - static local variables
   jmuller     12/30/08 - Fix bug 7658336 (sort of): remove pen_search_excp
   wxli        01/29/08 - TPCC in native mode
   sylin       05/11/07 - Sleeping beauties
   mvemulap    02/20/07 - bug 5846250 fix
   mvemulap    01/16/07 - bug 5551551
   mvemulap    01/04/07 - call pevm_jmpset directly on IA64
   dbronnik    12/21/06 - MODINCI/DECI
   sagrawal    10/03/06 - Native Support for Compound Triggers
   lvbcheng    08/29/06 - 5494813
   mvemulap    08/07/06 - canonical support for aix
   mvemulap    07/05/06 - fix typo for pen_UNHNDLD 
   kmuthukk    05/30/06 - project 5708: shared function result cache 
   lvbcheng    05/23/06 - REGEXP builtins in 11g
   mvemulap    05/08/06 - remove time_stamp_penlur 
   mkandarp    03/07/06 - 5001170 : Add pevm_MOVXN 
   mvemulap    11/09/05 - bug 4728671 fix 
   cracicot    07/11/05 - ANSI prototypes; miscellaneous cleanup 
   bwadding    06/13/05 - ANSI prototypes; miscellaneous cleanup 
   jmuller     11/06/03 - Fix bug 3178062: add cleanuplabel to _EXECS 
   astocks     11/25/03 - JMPBUF_ALLOC
   dbronnik    10/07/03 - 
   dbronnik    11/25/03 - Add pen_FIELDS
   dbronnik    11/20/03 - Move slgjmp business to spen0.h
   dbronnik    09/30/03 - Change exception handling
   rpang       08/20/03 - Added enter desc page number/offset to pen_PCLABELGET
   astocks     07/23/03 - Bug 2135852
   cwethere    07/08/03 - Remove old branch instructions.
   sylin       06/19/03 - Replace pen_CALL with pen_CALL_SETUP
   astocks     04/15/03 - Remove excess styles
   kmuthukk    01/13/03 - ncomp tuning
   astocks     01/23/03 - Lint
   astocks     01/10/03 - Ctl-C
   sylin       01/11/03 - 2711796: Remove is_sr_package from pen_INST
   mvemulap    10/19/02 - remove arrhdl from pen_BDCINI
   astocks     10/21/02 - Fix BDCINI
   dbronnik    10/07/02 - Add pen_BCTR
   sagrawal    09/27/02 - native support for sparse collections in bulk binds
   astocks     07/10/02 - Improve prototype for calls
   astocks     05/10/02 - More entries
   mvemulap    04/22/02 - remove const specifier in penlur_lib_unit_root
   mvemulap    01/04/02 - move scd to sga
   sylin       10/25/01 - 1863759: Implement ncomp tracing support
   sylin       10/18/01 - Add frame,preg and lnr to pen_PCLABELGET
   sylin       09/20/01 - remove pen_PIPE()
   sylin       09/18/01 - 1993492: use PE_PSUSPEND for ncomp pipelined function
   sylin       08/17/01 - 1864137: Pipelined function support for ncomp
   mvemulap    04/29/01 - remove const for eptvec_penlur decl
   kmuthukk    03/20/01 - fast reinit pkgs
   mvemulap    03/29/01 - compiler warnings
   mvemulap    01/31/01 - fix compiler warning
   dbronnik    12/06/00 - move CHK_INST to pvm.h
   kmuthukk    12/02/00 - penrun() moved to pen0.h
   kmuthukk    12/01/00 - remove s.h include
   dbronnik    11/29/00 - naming conventions
   dbronnik    11/21/00 - Ctrl-C support
   dbronnik    11/20/00 - add pen_PIPE
   mvemulap    11/07/00 - use const qualifier for penexc_parent
   mvemulap    11/01/00 - add const qual to entries in penexcdsc
   mvemulap    10/30/00 - move lnr to perc
   mvemulap    10/20/00 - change penrun prototype
   mvemulap    10/15/00 - modify penexcentry
   mvemulap    10/13/00 - add pen_INSTSR
   mvemulap    10/07/00 - add macro for GF
   mvemulap    09/23/00 -  
   mvemulap    08/24/00 - remove pen_RET
   mvemulap    08/14/00 - 
   mvemulap    07/30/00 -  
   mvemulap    07/25/00 - add rpc scd defn
   mvemulap    06/27/00 - tdo handle segment
   mvemulap    06/16/00 - PW -> PE
   sagrawal    07/03/00 - Dynamic dispatch
   kmuthukk    03/10/00 - more microkernels
   mvemulap    11/05/99 - 
   mvemulap    11/04/99 - 
   mvemulap    10/08/99 - add pvm_CVTNC
   mvemulap    09/14/99 - add pen_search_excp                                  
   kmuthukk    04/12/99 - return ub1 instead of perexc
   kmuthukk    03/24/99 - change dvoid * to void *
   mvemulap    03/12/99 - extra state arg to pen_ENTER                         
   kmuthukk    02/04/99 - DPF register                                         
   kmuthukk    02/03/99 - GF and DLO access                                    
   mvemulap    01/19/99 - add INSTNL and NCAL                                  
   kmuthukk    01/06/99 - fix comments                                         
   mvemulap    12/03/98 - add pen_XCAL                                         
   kmuthukk    11/25/98 - support for comparison/branch instructions           
   kmuthukk    11/04/98 - PL/SQL execute native interfaces                     
   kmuthukk    11/04/98 - Creation
*/

#ifndef PEN_ORACLE
# define PEN_ORACLE

# ifndef PN_ORACLE
#  include <pn.h>
# endif

# ifndef PVM_ORACLE
#  include <pvm.h>
# endif

# ifndef SPEN0_ORACLE
#  include <spen0.h>
# endif

#ifndef DISCARD
# define DISCARD (void)
#endif

/*---------------------------------------------------------------------------
                     PUBLIC TYPES AND CONSTANTS
 ---------------------------------------------------------------------------*/

/* type definition of an entry point function */
typedef pevm_excs (*pen_ept_fn_type)(void *ctx, void **argv);

/* type definition of a slot array initializer function */
typedef void (*pen_saif_type)(void **slot_array, void *frame);

/* bug fix 4728671: an entry in the exception table in readonly
 * format. This format closely resembles the exception table 
 * for the interpreted mode.
 */
struct penexc_Exception_Entry
{
  ub4   range_num;                    /* number of the range handled by this */
  ub4   parent_range_num;      /* number of the parent range handled by this */
  ub4   penedoer;                                              /* OER number */
  ub2   peneddid;                                              /* did number */
  ub2   penedidn;                                    /* exception identifier */
  ub4   penealtern;                                 /* exception alternative */
  ub4   peneline;                     /* line number where exception handled */
};
typedef struct penexc_Exception_Entry penexc_Exception_Entry;


/*
 * penlur_lib_unit_root: Is this root structure that leads to all
 * information about a native compiled library-unit.
 */
struct  penlur_lib_unit_root
{
  const struct pnpkd           *pkd_penlur; /* package (lib-unit) definition */
  const sb4                    *eofvec_penlur ;    /* array of entry offsets */
  pen_saif_type                saif_penlur;        /* slot array initializer */
  const penexc_Exception_Entry *excp_table_penlur;     /* excp handler table */
  void *line_table_penlur;                              /* line number table */
  void                        *base_address_penlur;       /* lu load address */
  ub8                          libunit_size_penlur;       /* size of libunit */
#define PENLUR_SHARED_MEMORY_OBJECT 0x00000001
#define PENLUR_SLOT_OFFSET_ARRAY    0x00000004
  ub4                          flags_penlur;                /* libunit flags */
  ub1 *string_table_penlur;                                  /* string table */

  /* Remember: you can't reorder the sleeping beauties, you can only rename
     them! */
  ub8   NorthDakota_penlur;                               /* Sleeping Beauty */
  ub8   Montana_penlur;                                   /* Sleeping Beauty */
  void *Wyoming_penlur;                                   /* Sleeping Beauty */
  void *Alaska_penlur;                                    /* Sleeping Beauty */
};
typedef struct penlur_lib_unit_root penlur_lib_unit_root;



/* long jump exception handler buffer */
struct pen_buffer
{
  pevm_jmpbuf buffer_pen_buffer;
  pevm_jmpbuf *save_pen_buffer;
  boolean     Must_Free;
};
typedef struct pen_buffer pen_buffer;

#define PEN_IS_SPECIAL_HANDLER(x) (((x).penedoer == 0) && ((x).penedidn == 2))

/*---------------------------------------------------------------------------
                     PRIVATE TYPES AND CONSTANTS
 ---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
                           PUBLIC FUNCTIONS
 ---------------------------------------------------------------------------*/
/* _EXEC: The instruction can only return PE_NONE */
#define _EXEC(instrn) DISCARD instrn

/* _EXECN: Jump to null label when the instruction returns 
 * PE_NUL */
#define _EXECN(instrn, null_lbl) \
  if ((psw = instrn) == PE_NUL) \
     goto null_lbl

/* Variation for PIPE */
#define _EXECS(ctx, instrn, plp, suspend_idx, cleanup_idx, ern, excp_range) \
plp##cleanup_idx:\
  ern = (excp_range);\
  if ((psw = instrn) == PE_PSUSPEND)\
  {\
    PEN_PCLABELSET(ctx, (ub4)suspend_idx, (ub4)cleanup_idx);\
    return PE_PSUSPEND; \
  }\
plp##suspend_idx:

/* _RET: Return instrn */
#define _RET(instrn, excp_lbl) \
  if (instrn) \
      goto excp_lbl; \
  else \
      return PE_NONE

/*
 * _EXECRET:
 *
 *  Variation use for ENTERX instruction.
 *
 *  If instruction returns a PE_FINAL_EXIT it is signal
 *  to return from the current frame. [During normal execution
 *  control will pass on to instruction after the ENTERX
 *  instruction. However, in special situations such
 *  as a "cache hit" on a result cached function, a status
 *  of PE_FINAL_EXIT will be returned from ENTERX.]
 */
#define _EXECRET(instrn) \
  if ((instrn) == PE_FINAL_EXIT) \
    return PE_NONE


/* BRANCH instructions */

#define pen_BREQ(ctx, psw, target_label) \
  if (psw & PE_ZER) goto target_label; 

#define pen_BRLT(ctx, psw, target_label) \
  if (psw & PE_NEG) goto target_label;

#define pen_BRLE(ctx, psw, target_label) \
  if (psw & (PE_NEG | PE_ZER)) goto target_label;

#define pen_BRREINI(ctx, target_label) \
  if (pevm_BRREINI(ctx)) goto target_label;

/* Miscellaneous renames */
#define pen_INSTC3 pevm_INSTC2

/* Flavors of BIND */
#define pen_BIND(ctx, src1, position, tmpub2, src2, flags) \
  pevm_BIND((ctx), (src1), (position), (tmpub2), (src2), (flags), (void *)0, 0, BIND) 

#define pen_CBIND(ctx, src1, position, tmpub2, src2, flags) \
  pevm_BIND((ctx), (src1), (position), (tmpub2), (src2), (flags), (void *)0, 0, CBIND) 

#define pen_RBIND(ctx, src1, position, tmpub2, src2, flags, src3, attr_no) \
  pevm_BIND((ctx), (src1), (position), (tmpub2), (src2), (flags),          \
            (src3), (attr_no), RBIND) 

/* INST: Instantiate another libunit body (and spec if
 * it is a package or a type libunit)
 */
void pen_INST(void *ctx, ub2 did, ub1 instkind);

void pen_CALL_SETUP(void  *ctx, pemtshd **arg_block);

/* XCAL: Call an entrypoint in an eXternal libunit */
void pen_XCAL_i(void *ctx, ub2 did, ub2 ept, pemtshd **arg_block,
                boolean xcalp);
#define pen_XCAL(ctx, did, ept, arg_block) \
        pen_XCAL_i((ctx), (did), (ept), (arg_block), TRUE)
#define pen_SCAL(ctx, did, ept, arg_block) \
        pen_XCAL_i((ctx), (did), (ept), (arg_block), FALSE)

/* DCAL: Call an entrypoint in an eXternal dynamic libunit */
#define pen_DCAL(ctx, did, ept, vti,  arg_block) \
        DISCARD pevm_DCAL((ctx), (ept), (vti), (ub1 **)0, (void **)(arg_block))

/* RCAL: Remote call */
#define pen_RCAL(ctx, src, arg_block) \
        DISCARD pevm_RCAL((ctx), (src), (void **)(arg_block))

void pen_ICAL(void *ctx, ub2 did, ub2 indicator, ub2 loc, ub2 argc, 
              pemtshd **arg_block);

#define pen_BCAL(ctx, loc, argc, arg_block) \
   pevm_icd_call_common((ctx), 0, 0, (loc), (argc), TRUE, ((void **)(arg_block))+1)

#define pen_MOVA(ctx, dst, src) (*(dst)) = (src)

#define pen_BDCINI_COLL(ctx, src1, bdflags, arrhdl) \
        pevm_BDCINI_i((ctx), (src1), (bdflags), (arrhdl))
#define pen_BDCINI(ctx, src1, bdflags) \
        pevm_BDCINI_i((ctx), (src1), (bdflags), (void *) 0)
pevm_excs pen_UNHNDLD(void *ctx);

pevm_excs pen_ENTERZ(void              *ctx,
                     ub2                entdesc_page_num,
                     ub2                entdesc_page_off,
                     pevmea_enter_args *args);

ub4 pen_PCLABELGET(void *ctx, ub2 entdesc_page_num, ub2 entdesc_page_off,
                   void *frame, ub1 ***out_reg, ub4 **lnr);

void pen_PCLABELSET(void *ctx, ub4 suspendlabel, ub4 cleanuplabel);

void pen_CTRLC(void *ctx);

boolean pen_BCTR(void const *src1, void const *src2);

#define pen_CHK_CTRL_BRK(ctx) \
do {if (--(((pvm_ctx_pub *)ctx)->ctlc_cnt) <= 0) pen_CTRLC(ctx); } while (0)

void pen_JMPBUF(void *ctx, pen_buffer *buffer);
void pen_JMPBUF_ALLOC(void *ctx, pen_buffer **buffer, size_t Buf_Size);

void pen_FIELDS(void *ctx, pevmea_enter_args *args);

ub4 pen_TRIGGER_FIRST_CALL(void *ctx, ub2 entdesc_page_num, 
                           ub2 entdesc_page_off);


/* bug 4728671 fix: 
 * pen_kernel: generic type for a function pointer. When invoking
 * a particular microkernel in the generated code, it is cast to the 
 * appropriate type cast for that micro kernel. This generic type
 * is needed so that we can declare an array of microkernels of the
 * type pevm_kernel.
 */
typedef void (*pen_kernel)();

/* bug 4728671 fix: In order to generate position independent code,
 * all calls to pevm_ microkernels need to be dispatched through a
 * kernel vector. The generated code accesses the kernel vector
 * through the perc_kernel_vector field of peidef.
 * NOTE: The order of the enum constants cannot be changed without
 * requiring a recompilation of already compiled libunits.
 */

typedef enum
  {
    PEN_BRREINI_INDEX,
    PEN_BRRESTORE_INDEX,
    PEN_ABSI_INDEX,
    PEN_ADDI_INDEX,
    PEN_ADDN_INDEX,
    PEN_BNDUC_INDEX,
    PEN_BREAK_INDEX,
    PEN_BFTCHC_INDEX,
    PEN_CLREX_INDEX,
    PEN_RASRX_INDEX,
    PEN_CBEG_INDEX,
    PEN_CSBEG_INDEX,
    PEN_CMP3C_INDEX,
    PEN_CMP3D_INDEX,
    PEN_CMP3I_INDEX,
    PEN_CMP3N_INDEX,
    PEN_CMP3R_INDEX,
    PEN_CMP3LOB_INDEX,
    PEN_CMP3REF_INDEX,
    PEN_CMP3UR_INDEX,
    PEN_CNVMSC_INDEX,
    PEN_CONCN_INDEX,
    PEN_CVTCFD_INDEX,
    PEN_CVTCFL_INDEX,
    PEN_CVTCI_I_INDEX,
    PEN_CVTCN_INDEX,
    PEN_CVTCUR_INDEX,
    PEN_CVTDFC_INDEX,
    PEN_CVTEI_INDEX,
    PEN_CVTHR_INDEX,
    PEN_CVTIC_INDEX,
    PEN_CVTIE_INDEX,
    PEN_CVTIN_INDEX,
    PEN_CVTLFC_INDEX,
    PEN_CVTNFC_INDEX,
    PEN_CVTRH_INDEX,
    PEN_CVTURC_INDEX,
    PEN_DECI_INDEX,
    PEN_DIVN_INDEX,
    PEN_EXECC_INDEX,
    PEN_I4EXIM_INDEX,
    PEN_EXIM_INDEX,
    PEN_I4OPND_INDEX,
    PEN_OPND_INDEX,
    PEN_INCI_INDEX,
    PEN_INITX_INDEX,
    PEN_JUNK2_INDEX,
    PEN_MOVADT_INDEX,
    PEN_MOVC_I_INDEX,
    PEN_MOVCR_INDEX,
    PEN_MOVD_INDEX,
    PEN_MOVDTM_INDEX,
    PEN_MOVI_INDEX,
    PEN_MOVITV_INDEX,
    PEN_MOVLOB_INDEX,
    PEN_MOVN_INDEX,
    PEN_MOVNU_INDEX,
    PEN_MOVOPQ_INDEX,
    PEN_MOVRAW_INDEX,
    PEN_MOVREF_INDEX,
    PEN_MOVRPAT_INDEX,
    PEN_MOVSELFA_INDEX,
    PEN_MOVUR_INDEX,
    PEN_MULI_INDEX,
    PEN_MSET_ADT_INDEX,
    PEN_MSET_INDEX,
    PEN_MULN_INDEX,
    PEN_NCAL_INDEX,
    PEN_SNCAL_INDEX,
    PEN_DCAL_INDEX,
    PEN_NEGI_INDEX,
    PEN_NEGN_INDEX,
    PEN_PATXS_INDEX,
    PEN_PIPE_INDEX,
    PEN_PRFTC_INDEX,
    PEN_RASIX_INDEX,
    PEN_RASUX_INDEX,
    PEN_RCAL_INDEX,
    PEN_JUNK3_INDEX,
    PEN_SETN_INDEX,
    PEN_SUBI_INDEX,
    PEN_SUBN_INDEX,
    PEN_SUBSTR_INDEX,
    PEN_TSTREF_INDEX,
    PEN_XORI_INDEX,
    PEN_INSI_SCALAR__INDEX,
    PEN_INSI_CURSREF__INDEX,
    PEN_INSI_UROWID_INDEX,
    PEN_INSI_CHAR_INDEX,
    PEN_INSI_LOB_INDEX,
    PEN_INSI_DATETIME_INDEX,
    PEN_INSI_INTERVAL_INDEX,
    PEN_INSI_ADT_INDEX,
    PEN_INSI_OPQ_INDEX,
    PEN_INSI_OBJREF_INDEX,
    PEN_INSI_INDEXED_SSCALAR_INDEX,
    PEN_INSI_INDEXED_CHAR_INDEX,
    PEN_INSI_INDEXED_LOB_INDEX,
    PEN_INSI_INDEXED_DATETIME_INDEX,
    PEN_INSI_INDEXED_INTERVAL_INDEX,
    PEN_INSI_INDEXED_ADT_INDEX,
    PEN_INSI_INDEXED_OPQ_INDEX,
    PEN_INSI_INDEXED_OBJREF_INDEX,
    PEN_INSI_INDEXED_INDEXED_INDEX,
    PEN_INBI_CURSREF_INDEX,
    PEN_INBI_UROWID_INDEX,
    PEN_INBI_CHAR_INDEX,
    PEN_INBI_LOB_INDEX,
    PEN_INBI_DATETIME_INDEX,
    PEN_INBI_INTERVAL_INDEX,
    PEN_INBI_ADT_INDEX,
    PEN_INBI_OPQ_INDEX,
    PEN_INBI_OBJREF_INDEX,
    PEN_INBI_INDEXED_SSCALAR_INDEX,
    PEN_INBI_INDEXED_UROWID_INDEX,
    PEN_INBI_INDEXED_CHAR_INDEX,
    PEN_INBI_INDEXED_DATETIME_INDEX,
    PEN_INBI_INDEXED_INTERVAL_INDEX,
    PEN_INBI_INDEXED_LOB_INDEX,
    PEN_INBI_INDEXED_ADT_INDEX,
    PEN_INBI_INDEXED_OPQ_INDEX,
    PEN_INBI_INDEXED_OBJREF_INDEX,
    PEN_INBI_INDEXED_INDEXED_INDEX,
    PEN_CCNST_INDEX,
    PEN_INSTC2_INDEX,
    PEN_CCSINF_INDEX,
    PEN_EXCOD_INDEX,
    PEN_EXMSG_INDEX,
    PEN_CLOSC_INDEX,
    PEN_BIND_INDEX,
    PEN_DEFINE_INDEX,
    PEN_FCAL_INDEX,
    PEN_ADEFINE_INDEX,
    PEN_BDCINI_I_INDEX,
    PEN_ARGEASCA_INDEX,
    PEN_ARGECOLL_INDEX,
    PEN_ARGEIBBI_INDEX,
    PEN_ARPEASCA_INDEX,
    PEN_ARPECOLL_INDEX,
    PEN_ARPEIBBI_INDEX,
    PEN_BCNSTR_INDEX,
    PEN_RET_INDEX,
    PEN_RNDDC_I_INDEX,
    PEN_LSTD_INDEX,
    PEN_ADDDN_I_INDEX,
    PEN_SUBDD_INDEX,
    PEN_ADDMDN_INDEX,
    PEN_MBTD_INDEX,
    PEN_NXTD_INDEX,
    PEN_ENTER_INDEX,
    PEN_BNDS_INDEX,
    PEN_COPN_INDEX,
    PEN_GBCR_INDEX,
    PEN_CFND_INDEX,
    PEN_CSFND_INDEX,
    PEN_CRWC_INDEX,
    PEN_CSRWC_INDEX,
    PEN_BCRWC_INDEX,
    PEN_BCSRWC_INDEX,
    PEN_GBVAR_INDEX,
    PEN_SBVAR_INDEX,
    PEN_GBEX_INDEX,
    PEN_SBEX_INDEX,
    PEN_GETFX_INDEX,
    PEN_SETFX_INDEX,
    PEN_MOVX_INDEX,
    PEN_EXTX_INDEX,
    PEN_INMDH_CHAR_INDEX,
    PEN_INMDH_LOB_INDEX,
    PEN_INMDH_DATETIME_INDEX,
    PEN_INMDH_INTERVAL_INDEX,
    PEN_INMDH_ADT_INDEX,
    PEN_INMDH_INDEXED_SSCALAR_INDEX,
    PEN_INMDH_INDEXED_OBJREF_INDEX,
    PEN_INMDH_INDEXED_OPQ_INDEX,
    PEN_INMDH_INDEXED_INDEXED_INDEX,
    PEN_INMDH_INDEXED_ADT_INDEX,
    PEN_INMDH_INDEXED_CHAR_INDEX,
    PEN_INMDH_INDEXED_UROWID_INDEX,
    PEN_INMDH_INDEXED_LOB_INDEX,
    PEN_INMDH_INDEXED_DATETIME_INDEX,
    PEN_INMDH_INDEXED_INTERVAL_INDEX,
    PEN_INMDH_OPQ_INDEX,
    PEN_INMDH_OBJREF_INDEX,
    PEN_INHFA_COMMON_INDEX,
    PEN_INHFA1_COMMON_INDEX,
    PEN_INHFA_FCHAR_INDEX,
    PEN_INHFA_LOB_INDEX,
    PEN_INHFA_OBJREF_INDEX,
    PEN_INHFA_DATETIME_INDEX,
    PEN_INHFA_INTERVAL_INDEX,
    PEN_INHFA_ADT_INDEX,
    PEN_INHFA_OPQ_INDEX,
    PEN_INHFA_INDEXED_SSCALAR_INDEX,
    PEN_INHFA_INDEXED_CHAR_INDEX,
    PEN_INHFA_INDEXED_LOB_INDEX,
    PEN_INHFA_INDEXED_DATETIME_INDEX,
    PEN_INHFA_INDEXED_INTERVAL_INDEX,
    PEN_INHFA_INDEXED_ADT_INDEX,
    PEN_INHFA_INDEXED_INDEXED_INDEX,
    PEN_INHFA_INDEXED_OPQ_INDEX,
    PEN_INHFA_INDEXED_OBJREF_INDEX,
    PEN_TREAT_INDEX,
    PEN_CMPIO_INDEX,
    PEN_ABSN_INDEX,
    PEN_JUNK1_INDEX,
    PEN_ISNULL_INDEX,
    PEN_NULCHK_INDEX,
    PEN_RNGCHKI_INDEX,
    PEN_RNGCHKF_INDEX,
    PEN_ANDB_INDEX,
    PEN_ORB_INDEX,
    PEN_NOTB_INDEX,
    PEN_CHSNULL_INDEX,
    PEN_REL2BOOL_INDEX,
    PEN_MINMAX_INDEX,
    PEN_ADDD_INDEX,
    PEN_ADDF_INDEX,
    PEN_SUBD_INDEX,
    PEN_SUBF_INDEX,
    PEN_MULD_INDEX,
    PEN_MULF_INDEX,
    PEN_DIVD_INDEX,
    PEN_DIVF_INDEX,
    PEN_NEGD_INDEX,
    PEN_NEGF_INDEX,
    PEN_ABSD_INDEX,
    PEN_ABSF_INDEX,
    PEN_MOVDBL_INDEX,
    PEN_MOVFLT_INDEX,
    PEN_CMP3DBL_INDEX,
    PEN_CMP3FLT_INDEX,
    PEN_VATTR_INDEX,
    PEN_FTCHC_PSEUDO_INDEX,
    PEN_VALIST_INDEX,
    PEN_VALISTINI_INDEX,
    PEN_VCAL_INDEX,
    PEN_OVER_INDEX,
    PEN_REGEXP_INSTR_CLB_INDEX,
    PEN_REGEXP_INSTR_TXT_INDEX,
    PEN_REGEXP_LIKE_CLB_INDEX,
    PEN_REGEXP_LIKE_TXT_INDEX,
    PEN_REGEXP_REPLACE_CLB_INDEX,
    PEN_REGEXP_REPLACE_CLB2_INDEX,
    PEN_REGEXP_REPLACE_TXT_INDEX,
    PEN_REGEXP_SUBSTR_CLB_INDEX,
    PEN_REGEXP_SUBSTR_TXT_INDEX,
    PEN_REGEXP_COUNT_CLB_INDEX,
    PEN_REGEXP_COUNT_TXT_INDEX,
    PEN_REGEXP_INSTR_CLB2_INDEX,
    PEN_REGEXP_INSTR_TXT2_INDEX,
    PEN_REGEXP_RESERVED1_INDEX,
    PEN_REGEXP_RESERVED2_INDEX,
    PEN_REGEXP_RESERVED3_INDEX,
    PEN_REGEXP_RESERVED4_INDEX,
    PEN_REGEXP_RESERVED5_INDEX,
    PEN_REGEXP_SUBSTR_CLB2_INDEX,
    PEN_REGEXP_SUBSTR_TXT2_INDEX,
    PEN_RCPAT_INDEX,
    PEN_INSI_RCPAT_INDEX,
    PEN_RAISE_JUMP_INDEX,
    PENSXP_SEARCH_EXCEPTION_INDEX,
    PEN_UNHNDLD_INDEX,
    PEN_CTRLC_INDEX,
    PEN_CALL_SETUP_INDEX,
    PEN_INST_INDEX,
    PEN_JMPBUF_ALLOC_INDEX,
    PEN_XCAL_I_INDEX,
    PEN_JMPSET_INDEX,
    PEN_JMPBUF_INDEX,
    PEN_FIELDS_INDEX,
    PEN_ICD_CALL_COMMON_INDEX,
    PEN_ICAL_INDEX,
    PEN_PCLABELGET_INDEX,
    PEN_PCLABELSET_INDEX,
    PEN_BCTR_INDEX,
    PEN_MODABSI_INDEX,
    PEN_MODADDI_INDEX,
    PEN_MODMULI_INDEX,
    PEN_MODNEGI_INDEX,
    PEN_MODSUBI_INDEX,
    PEN_MODINCI_INDEX,
    PEN_MODDECI_INDEX,
    PEN_MOVXN_INDEX,
    PEN_SUSPEND_INDEX,
    PEN_ENTERX_INDEX,
    PEN_INSROW_INDEX,
    PEN_INSERT_INDEX,
    PEN_DSELBEG_INDEX,
    PEN_XSELBEG_INDEX,
    PEN_UPDATE_INDEX,
    PEN_STMEND_INDEX,
    PEN_DSELNEXT_INDEX,
    PEN_DSELEND_INDEX,
    PEN_DSELBYRID_INDEX,
    PEN_XSELNEXT_INDEX,
    PEN_XSELEND_INDEX,
    PEN_INSBEG_INDEX,
    PEN_INSEND_INDEX,
    PEN_STMBEG_INDEX,
    PEN_DSELRONEXT_INDEX
  } pen_vector_index;

#ifdef PEN_INDIRECT_CALLS

#define PEN_BRREINI ((boolean (*) (void *))(Pen_Vector[PEN_BRREINI_INDEX]))
#define PEN_BRRESTORE ((boolean (*) (void *))(Pen_Vector[PEN_BRRESTORE_INDEX]))
#define PEN_ABSI ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_ABSI_INDEX]))
#define PEN_ADDI ((void (*) (void*, void const *, void const *, void*)) \
  (Pen_Vector[PEN_ADDI_INDEX]))
#define PEN_ADDN ((void (*) (void*, void const *, void const *, void*)) \
  (Pen_Vector[PEN_ADDN_INDEX]))
#define PEN_BNDUC ((void (*) (void*, void const *, ub2, ub2, ub2)) \
  (Pen_Vector[PEN_BNDUC_INDEX]))
#define PEN_BREAK ((void (*) (void*)) (Pen_Vector[PEN_BREAK_INDEX]))
#define PEN_BFTCHC ((pevm_excs (*) (void*, void const *, void const *)) \
  (Pen_Vector[PEN_BFTCHC_INDEX]))
#define PEN_FTCHC(ctx, src1) PEN_BFTCHC(ctx, src1, (void *)0)
#define PEN_CLREX ((void (*) (void*)) (Pen_Vector[PEN_CLREX_INDEX]))
#define PEN_RASRX ((void (*) (void*, boolean)) (Pen_Vector[PEN_RASRX_INDEX]))
#define PEN_CBEG ((void (*) (void*, ub1, void const *, void *, void const*)) \
  (Pen_Vector[PEN_CBEG_INDEX]))
#define PEN_CSBEG ((void (*) (void*, ub1, void *, void const*)) \
  (Pen_Vector[PEN_CSBEG_INDEX]))
#define PEN_CMP3C ((pevm_excs (*) (void*, void const *, void const *)) \
  (Pen_Vector[PEN_CMP3C_INDEX]))
#define PEN_CMP3D_I ((pevm_excs (*) (void*, ub1, void const *, void const*)) \
  (Pen_Vector[PEN_CMP3D_INDEX]))
#define PEN_CMP3I ((pevm_excs (*) (void*, void const *, void const*)) \
  (Pen_Vector[PEN_CMP3I_INDEX]))
#define PEN_CMP3N ((pevm_excs (*) (void*, void const *, void const*)) \
  (Pen_Vector[PEN_CMP3N_INDEX]))
#define PEN_CMP3R ((pevm_excs (*) (void*, void const *, void const*)) \
  (Pen_Vector[PEN_CMP3R_INDEX]))
#define PEN_CMP3LOB ((pevm_excs (*) (void*, void const *, void const*)) \
  (Pen_Vector[PEN_CMP3LOB_INDEX]))
#define PEN_CMP3REF ((pevm_excs (*) (void*, void const *, void const*)) \
  (Pen_Vector[PEN_CMP3REF_INDEX]))
#define PEN_CMP3UR ((pevm_excs (*) (void*, void const *, void const*)) \
  (Pen_Vector[PEN_CMP3UR_INDEX]))
#define PEN_CNVMSC ((void (*) (void*, void const *, ub1, void *)) \
  (Pen_Vector[PEN_CNVMSC_INDEX]))
#define PEN_CONCN ((void (*) (void*, void **, ub4, boolean)) \
  (Pen_Vector[PEN_CONCN_INDEX]))
#define PEN_CVTCFD ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_CVTCFD_INDEX]))
#define PEN_CVTCD(ctx, src1, dst) PEN_CVTCFD(ctx, src1, (void *)0, dst)
#define PEN_CVTCFL ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_CVTCFL_INDEX]))
#define PEN_CVTCL(ctx, src1, dst) PEN_CVTCFL(ctx, src1, (void *)0, dst)
#define PEN_CVTCI_I ((void (*) (void*, void const *, void *, boolean)) \
  (Pen_Vector[PEN_CVTCI_I_INDEX]))
#define PEN_CVTCI(ctx, src1, dst) PEN_CVTCI_I(ctx, src1, dst, TRUE)
#define PEN_CVTNI(ctx, src1, dst) PEN_CVTCI_I(ctx, src1, dst, FALSE)
#define PEN_CVTCN ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_CVTCN_INDEX]))
#define PEN_CVTCUR ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_CVTCUR_INDEX]))
#define PEN_CVTDFC ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_CVTDFC_INDEX]))
#define PEN_CVTDC(ctx, src1, dst) PEN_CVTDFC(ctx, src1, (void *)0, dst)
#define PEN_CVTEI ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_CVTEI_INDEX]))
#define PEN_CVTHR ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_CVTHR_INDEX]))
#define PEN_CVTIC ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_CVTIC_INDEX]))
#define PEN_CVTIE ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_CVTIE_INDEX]))
#define PEN_CVTIN ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_CVTIN_INDEX]))
#define PEN_CVTLFC ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_CVTLFC_INDEX]))
#define PEN_CVTLC(ctx, src1, dst) PEN_CVTLFC(ctx, src1, (void *)0, dst)
#define PEN_CVTNFC ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_CVTNFC_INDEX]))
#define PEN_CVTNC(ctx, src1, dst) PEN_CVTNFC(ctx, src1, (void *)0, dst)
#define PEN_CVTRH ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_CVTRH_INDEX]))
#define PEN_CVTURC ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_CVTURC_INDEX]))
#define PEN_DECI ((void (*) (void*, void*)) (Pen_Vector[PEN_DECI_INDEX]))
#define PEN_DIVN ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_DIVN_INDEX]))
#define PEN_EXECC ((void (*) (void*, void const *, ub4)) \
  (Pen_Vector[PEN_EXECC_INDEX]))
#define PEN_I4EXIM \
((void (*) (void*, void *, const void*, ub2, ub2, ub4, ub4, sb4, void *)) \
  (Pen_Vector[PEN_I4EXIM_INDEX]))
#define PEN_EXIM ((void (*) (void*, void const *)) \
  (Pen_Vector[PEN_EXIM_INDEX]))
#define PEN_I4OPND \
  ((void (*) (void*, ub1, sb4, void*, void const*, ub2, ub4, sb4)) \
  (Pen_Vector[PEN_I4OPND_INDEX]))
#define PEN_OPND ((void (*) (void*, void const *)) \
  (Pen_Vector[PEN_OPND_INDEX]))
#define PEN_INCI ((void (*) (void*, void *)) \
  (Pen_Vector[PEN_INCI_INDEX]))
#define PEN_INITX ((pevm_excs (*) (void*, void const *, const void *)) \
  (Pen_Vector[PEN_INITX_INDEX]))
#define PEN_MODI ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_MODI_INDEX]))
#define PEN_MOVA pen_MOVA
#define PEN_MOVADT ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVADT_INDEX]))
#define PEN_MOVC_I ((void (*) (void*, ub1, void const *, void *)) \
  (Pen_Vector[PEN_MOVC_I_INDEX]))
#define PEN_MOVC(ctx, src1, dst) PEN_MOVC_I(ctx, (ub1)MOVC, src1, dst)
#define PEN_MOVCB(ctx, src1, dst) PEN_MOVC_I(ctx, (ub1)MOVCB, src1, dst)
#define PEN_MOVFCU(ctx, src1, dst) PEN_MOVC_I(ctx, (ub1)MOVFCU, src1, dst)
#define PEN_MOVCR \
((void (*) (void*, void const *, void const *, ub1, void *, ub1, sb4)) \
  (Pen_Vector[PEN_MOVCR_INDEX]))
#define PEN_MOVD ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVD_INDEX]))
#define PEN_MOVDTM ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVDTM_INDEX]))
#define PEN_MOVI ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVI_INDEX]))
#define PEN_MOVITV ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVITV_INDEX]))
#define PEN_MOVLOB ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVLOB_INDEX]))
#define PEN_MOVN \
  ((void (*) (void*, void const*, const ub1, const ub1, void*)) (\
  Pen_Vector[PEN_MOVN_INDEX]))
#define PEN_MOVNU ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVNU_INDEX]))
#define PEN_MOVOPQ ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVOPQ_INDEX]))
#define PEN_MOVRAW ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVRAW_INDEX]))
#define PEN_MOVREF ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVREF_INDEX]))
#define PEN_MOVRPAT ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVRPAT_INDEX]))
#define PEN_MOVSELFA ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVSELFA_INDEX]))
#define PEN_MOVUR ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVUR_INDEX]))
#define PEN_MULI ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_MULI_INDEX]))
#define PEN_MSET_ADT ((void (*) (void*, const ub2, void *, void *, void *)) \
  (Pen_Vector[PEN_MSET_ADT_INDEX]))
#define PEN_MSET \
  ((void (*) (void*, const ub1, void const *, void const*, void *)) \
  (Pen_Vector[PEN_MSET_INDEX]))
#define PEN_MULN ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_MULN_INDEX]))
#define PEN_NCAL ((pevm_excs (*) (void*, ub2, ub2, void **, void *)) \
  (Pen_Vector[PEN_NCAL_INDEX]))
#define PEN_SNCAL ((pevm_excs (*) (void*,  ub2, ub2, void **)) \
  (Pen_Vector[PEN_SNCAL_INDEX]))
#define PEN_DCAL(ctx, did, ept, vti, arg_block) \
  ((pevm_excs (*) (void*, ub2, ub2, ub1 **, void **)) \
  (Pen_Vector[PEN_DCAL_INDEX])) \
  ((ctx), (ept), (vti), (ub1 **)0, (void **)(arg_block))
#define PEN_NEGI ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_NEGI_INDEX]))
#define PEN_NEGN ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_NEGN_INDEX]))
#define PEN_PATXS ((void (*) (void*)) (Pen_Vector[PEN_PATXS_INDEX]))
#define PEN_PIPE ((pevm_excs (*) (void*, void const *)) \
  (Pen_Vector[PEN_PIPE_INDEX]))
#define PEN_PRFTC ((void (*) (void*, void const *, void const*)) \
  (Pen_Vector[PEN_PRFTC_INDEX]))
#define PEN_RASIX ((void (*) (void*, ub4)) (Pen_Vector[PEN_RASIX_INDEX]))
#define PEN_RASUX ((void (*) (void*, ub2, ub2)) (Pen_Vector[PEN_RASUX_INDEX]))
#define PEN_RCAL ((pevm_excs (*) (void*, void const *, void **)) \
  (Pen_Vector[PEN_RCAL_INDEX]))
#define PEN_REMI ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_REMI_INDEX]))
#define PEN_SETN ((void (*) (void*, void *, ub1)) (Pen_Vector[PEN_SETN_INDEX]))
#define PEN_SUBI ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_SUBI_INDEX]))
#define PEN_SUBN ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_SUBN_INDEX]))
#define PEN_SUBSTR \
  ((void (*) (void*, ub4, void const *, void const*, void const *, void*)) \
  (Pen_Vector[PEN_SUBSTR_INDEX]))
#define PEN_TSTREF ((pevm_excs (*) (void*, void const *)) \
  (Pen_Vector[PEN_TSTREF_INDEX]))
#define PEN_XORI ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_XORI_INDEX]))
#define PEN_INSI_SCALAR_ ((void (*) (void*, void *, plsmut *, void *, ub2)) \
  (Pen_Vector[PEN_INSI_SCALAR__INDEX]))

#define PEN_INSI_CURSREF_ ((void (*) (void*, void *, plsmut*, void *)) \
  (Pen_Vector[PEN_INSI_CURSREF__INDEX]))

#define PEN_INSI_UROWID \
  ((void (*) (void*, void *, plsmut*, void *, ub4, ub1, ub1, pemttcat, ub1)) \
  (Pen_Vector[PEN_INSI_UROWID_INDEX]))
#define PEN_INSI_CHAR \
  ((void (*) (void*, void *, plsmut*, void *, ub4, ub1, ub1, pemttcat, ub1)) \
  (Pen_Vector[PEN_INSI_CHAR_INDEX]))
#define PEN_INSI_LOB \
  ((void (*) (void*, void *, plsmut*, void *, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INSI_LOB_INDEX]))
#define PEN_INSI_DATETIME \
  ((void (*) (void*, void *, plsmut*, void *, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INSI_DATETIME_INDEX]))
#define PEN_INSI_INTERVAL \
  ((void (*) (void*, void *, plsmut*, void *, ub1, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INSI_INTERVAL_INDEX]))
#define PEN_INSI_ADT \
  ((void (*) (void*, void *, plsmut*, void *, ub4, ub1, ub1)) \
  (Pen_Vector[PEN_INSI_ADT_INDEX]))
#define PEN_INSI_OPQ ((void (*) (void*, void *, plsmut*, void *, ub4, ub1)) \
  (Pen_Vector[PEN_INSI_OPQ_INDEX]))
#define PEN_INSI_OBJREF ((void (*) (void*, void *, plsmut*, void *, ub4, ub1)) \
  (Pen_Vector[PEN_INSI_OBJREF_INDEX]))
#define PEN_INSI_INDEXED_SSCALAR \
  ((void (*) (void*, void *, plsmut *, void*, void*, ub4, ub1, ub1)) \
  (Pen_Vector[PEN_INSI_INDEXED_SSCALAR_INDEX]))
#define PEN_INSI_INDEXED_CHAR \
  ((void (*) (void*, void *, plsmut *, void *, void*, ub4, ub1, ub1, \
  ub1, ub4, ub1)) \
  (Pen_Vector[PEN_INSI_INDEXED_CHAR_INDEX]))
#define PEN_INSI_INDEXED_LOB \
  ((void (*) (void*, void *, plsmut *, void *, void*, ub4, ub1, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INSI_INDEXED_LOB_INDEX]))
#define PEN_INSI_INDEXED_DATETIME \
  ((void (*) (void*, void *, plsmut *, void *, void*, ub4, ub1, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INSI_INDEXED_DATETIME_INDEX]))
#define PEN_INSI_INDEXED_INTERVAL \
  ((void (*) (void*, void *, plsmut *, void *, void*, ub4, ub1, ub1, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INSI_INDEXED_INTERVAL_INDEX]))
#define PEN_INSI_INDEXED_ADT \
  ((void (*) (void*, void *, plsmut *, void *, void*, ub4, ub1, ub1, ub4, ub1)) \
  (Pen_Vector[PEN_INSI_INDEXED_ADT_INDEX]))
#define PEN_INSI_INDEXED_OPQ \
  ((void (*) (void*, void *, plsmut *, void *, void*, ub4, ub1, ub1, ub4)) \
  (Pen_Vector[PEN_INSI_INDEXED_OPQ_INDEX]))
#define PEN_INSI_INDEXED_OBJREF \
  ((void (*) (void*, void *, plsmut *, void *, void*, ub4, ub1, ub1, ub4)) \
  (Pen_Vector[PEN_INSI_INDEXED_OBJREF_INDEX]))
#define PEN_INSI_INDEXED_INDEXED \
  ((void (*) (void*, void *, plsmut *, void *, void*, ub4, ub1, ub1, ub4)) \
  (Pen_Vector[PEN_INSI_INDEXED_INDEXED_INDEX]))

#define PEN_INBI_CURSREF \
  ((void (*) (void*, void *, plsmut*, void *, ub1)) \
  (Pen_Vector[PEN_INBI_CURSREF_INDEX]))
#define PEN_INBI_UROWID \
  ((void (*) (void*, void *, plsmut*, void *, ub2, ub1, ub1, pemttcat)) \
  (Pen_Vector[PEN_INBI_UROWID_INDEX]))
#define PEN_INBI_CHAR \
  ((void (*) (void*, void *, plsmut*, void *, ub4, ub1, ub1, pemttcat, ub1)) \
  (Pen_Vector[PEN_INBI_CHAR_INDEX]))
#define PEN_INBI_LOB \
  ((void (*) (void*, void *, plsmut*, void *, ub2, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INBI_LOB_INDEX]))
#define PEN_INBI_DATETIME \
  ((void (*) (void*, void *, plsmut *, void *, ub2, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INBI_DATETIME_INDEX]))
#define PEN_INBI_INTERVAL \
  ((void (*) (void*, void *, plsmut *, void *, ub2, ub1, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INBI_INTERVAL_INDEX]))
#define PEN_INBI_ADT \
  ((void (*) (void*, void *, plsmut *, void *, ub4, ub2, ub1, ub1)) \
  (Pen_Vector[PEN_INBI_ADT_INDEX]))
#define PEN_INBI_OPQ \
  ((void (*) (void*, void *, plsmut *, void *, ub4, ub2, ub1)) \
  (Pen_Vector[PEN_INBI_OPQ_INDEX]))
#define PEN_INBI_OBJREF \
  ((void (*) (void*, void *, plsmut *, void *, ub4, ub2, ub1)) \
  (Pen_Vector[PEN_INBI_OBJREF_INDEX]))
#define PEN_INBI_INDEXED_SSCALAR \
  ((void (*) (void*, void *, plsmut *, void *, void *, ub2, ub4, ub1, ub1)) \
  (Pen_Vector[PEN_INBI_INDEXED_SSCALAR_INDEX]))
#define PEN_INBI_INDEXED_UROWID \
  ((void (*) (void*, void *, plsmut *, void *, void *, ub2, ub4, ub1, \
  ub1, ub1, ub4, ub1)) \
  (Pen_Vector[PEN_INBI_INDEXED_UROWID_INDEX]))
#define PEN_INBI_INDEXED_CHAR \
  ((void (*) (void*, void *, plsmut *, void *, void *, ub2, \
  ub4, ub1, ub1, ub1, ub4, ub1)) \
  (Pen_Vector[PEN_INBI_INDEXED_CHAR_INDEX]))
#define PEN_INBI_INDEXED_DATETIME \
  ((void (*) (void*, void *, plsmut *, void *, void *, ub2, \
  ub4, ub1, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INBI_INDEXED_DATETIME_INDEX]))
#define PEN_INBI_INDEXED_INTERVAL \
  ((void (*) (void*, void *, plsmut *, void *, void *, ub2, \
  ub4, ub1, ub1, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INBI_INDEXED_INTERVAL_INDEX]))
#define PEN_INBI_INDEXED_LOB \
  ((void (*) (void*, void *, plsmut *, void *, void *, ub2, \
  ub4, ub1, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INBI_INDEXED_LOB_INDEX]))
#define PEN_INBI_INDEXED_ADT \
  ((void (*) (void*, void *, plsmut *, void *, void *, ub2, \
ub4, ub1, ub1, ub4, ub1)) \
  (Pen_Vector[PEN_INBI_INDEXED_ADT_INDEX]))
#define PEN_INBI_INDEXED_OPQ \
  ((void (*) (void*, void *, plsmut *, void *, void *, ub2, \
  ub4, ub1, ub1, ub4)) \
  (Pen_Vector[PEN_INBI_INDEXED_OPQ_INDEX]))
#define PEN_INBI_INDEXED_OBJREF \
  ((void (*) (void*, void *, plsmut *, void *, void *, ub2, \
  ub4, ub1, ub1, ub4)) \
  (Pen_Vector[PEN_INBI_INDEXED_OBJREF_INDEX]))
#define PEN_INBI_INDEXED_INDEXED \
((void (*) (void*, void *, plsmut *, void *, void *, ub2,   \
  ub4, ub1, ub1, ub4)) \
  (Pen_Vector[PEN_INBI_INDEXED_INDEXED_INDEX]))
#define PEN_CCNST ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_CCNST_INDEX]))
#define PEN_INSTC2 \
  ((void (*) (void*, void const *, void const*, void *, ub1, sb4, boolean)) \
  (Pen_Vector[PEN_INSTC2_INDEX]))
#define PEN_CCSINF ((void (*) (void*, void const *, void *, ub1, ub1)) \
  (Pen_Vector[PEN_CCSINF_INDEX]))
#define PEN_EXCOD ((void (*) (void*, void *)) (Pen_Vector[PEN_EXCOD_INDEX]))
#define PEN_EXMSG ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_EXMSG_INDEX]))
#define PEN_CLOSC ((void (*) (void*, void const *, ub1)) \
  (Pen_Vector[PEN_CLOSC_INDEX]))
#define PEN_BIND(ctx, src1, position, tmpub2, src2, flags) \
  ((void (*) (void*, void const *, ub2, ub2, void const*, ub2, \
  void const *, ub2, ub1)) \
  (Pen_Vector[PEN_BIND_INDEX]))((ctx), (src1), (position), (tmpub2), \
  (src2), (flags), (void *)0, 0, BIND)

#define PEN_CBIND(ctx, src1, position, tmpub2, src2, flags) \
  ((void (*) (void*, void const *, ub2, ub2, void const*, ub2, \
  void const *, ub2, ub1)) \
  (Pen_Vector[PEN_BIND_INDEX]))((ctx), (src1), (position), (tmpub2), \
  (src2), (flags), (void *)0, 0, CBIND)
#define PEN_RBIND(ctx, src1, position, tmpub2, src2, flags, src3, attr_no) \
  ((void (*) (void*, void const *, ub2, ub2, void const*, ub2, \
  void const *, ub2, ub1)) \
  (Pen_Vector[PEN_BIND_INDEX]))((ctx), (src1), (position), (tmpub2), \
  (src2), (flags),  (src3), (attr_no), RBIND)
#define PEN_DEFINE ((void (*) (void*, void const *, ub2, ub2, ub2, void *)) \
  (Pen_Vector[PEN_DEFINE_INDEX]))
#define PEN_FCAL ((void (*) (void*, void const*)) (Pen_Vector[PEN_FCAL_INDEX]))
#define PEN_ADEFINE \
  ((void (*) (void*, void const *, ub2, ub2, ub2, void const*, \
  ub2, void const *, void const *, ub2, ub1)) \
  (Pen_Vector[PEN_ADEFINE_INDEX]))
#define PEN_BDCINI_I \
  ((void (*) (void*, void const *, ub1, void const *)) \
  (Pen_Vector[PEN_BDCINI_I_INDEX]))
#define PEN_ARGEASCA ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_ARGEASCA_INDEX]))
#define PEN_ARGECOLL ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_ARGECOLL_INDEX]))
#define PEN_ARGEIBBI ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_ARGEIBBI_INDEX]))
#define PEN_ARPEASCA ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_ARPEASCA_INDEX]))
#define PEN_ARPECOLL ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_ARPECOLL_INDEX]))
#define PEN_ARPEIBBI ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_ARPEIBBI_INDEX]))
#define PEN_BCNSTR ((void (*) (void*, void const *, sb4, sb4, ub2, ub4)) \
  (Pen_Vector[PEN_BCNSTR_INDEX]))
#define PEN_RET ((pevm_excs (*) (void*, ub1**)) (Pen_Vector[PEN_RET_INDEX]))
#define PEN_RNDDC_I \
  ((void (*) (void*, void const *, void const*, void *, boolean)) \
  (Pen_Vector[PEN_RNDDC_I_INDEX]))
#define PEN_RNDD(ctx, src1, dst) PEN_RNDDC_I(ctx, src1, (void *)0, dst, TRUE)
#define PEN_RNDDC(ctx, src1, src2, dst) PEN_RNDDC_I(ctx, src1,  src2, dst, TRUE)
#define PEN_TRND(ctx, src1, dst) PEN_RNDDC_I(ctx, src1,  (void *)0, dst, FALSE)
#define PEN_TRNDC(ctx, src1, src2, dst) PEN_RNDDC_I(ctx, src1,  src2, dst, FALSE)
#define PEN_LSTD ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_LSTD_INDEX]))
#define PEN_ADDDN_I \
  ((void (*) (void*, void const *, void const*, void *, boolean)) \
  (Pen_Vector[PEN_ADDDN_I_INDEX]))
#define PEN_ADDDN(ctx, src1, src2, dst) PEN_ADDDN_I(ctx, src1, src2, dst, FALSE)
#define PEN_SUBDN(ctx, src1, src2, dst) PEN_ADDDN_I(ctx, src1, src2, dst, TRUE)
#define PEN_SUBDD ((void (*) (void*, void const *, void const*, void *)) \
  (Pen_Vector[PEN_SUBDD_INDEX]))
#define PEN_ADDMDN ((void (*) (void*, void const *, void const*, void *)) \
  (Pen_Vector[PEN_ADDMDN_INDEX]))
#define PEN_MBTD ((void (*) (void*, void const *, void const*, void *)) \
  (Pen_Vector[PEN_MBTD_INDEX]))
#define PEN_NXTD ((void (*) (void*, void const *, void const*, void *)) \
  (Pen_Vector[PEN_NXTD_INDEX]))
#define PEN_ENTER ((void (*) (void*, ub2, ub2, pevmea_enter_args *)) \
  (Pen_Vector[PEN_ENTER_INDEX]))
#define PEN_ENTERX ((pevm_excs (*) (void*, ub2, ub2, pevmea_enter_args *)) \
  (Pen_Vector[PEN_ENTERX_INDEX]))
#define PEN_BNDS ((void (*) (void*, void *, void const *, void const *)) \
  (Pen_Vector[PEN_BNDS_INDEX]))
#define PEN_COPN ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_COPN_INDEX]))
#define PEN_GBCR ((void (*) (void*, ub2, void const *, void *)) \
  (Pen_Vector[PEN_GBCR_INDEX]))
#define PEN_CFND ((void (*) (void*, void const *, ub1, void *)) \
  (Pen_Vector[PEN_CFND_INDEX]))
#define PEN_CSFND ((void (*) (void*, ub1, void *)) \
  (Pen_Vector[PEN_CSFND_INDEX]))
#define PEN_CRWC ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_CRWC_INDEX]))
#define PEN_CSRWC ((void (*) (void*, void *)) (Pen_Vector[PEN_CSRWC_INDEX]))
#define PEN_BCRWC ((void (*) (void*, void const *, void const*, void *)) \
  (Pen_Vector[PEN_BCRWC_INDEX]))
#define PEN_BCSRWC ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_BCSRWC_INDEX]))
#define PEN_GBVAR ((pevm_excs (*) (void*,  ub2, ub2, void *)) \
  (Pen_Vector[PEN_GBVAR_INDEX]))
#define PEN_SBVAR ((pevm_excs (*) (void*,  ub2, ub2, const void *)) \
  (Pen_Vector[PEN_SBVAR_INDEX]))
#define PEN_GBEX ((void (*) (void*, ub2, ub2, void const *, void *)) \
  (Pen_Vector[PEN_GBEX_INDEX]))
#define PEN_SBEX ((void (*) (void*, ub2, ub2, void const *, void const*)) \
  (Pen_Vector[PEN_SBEX_INDEX]))
#define PEN_GETFX ((void (*) (void*, ub2, void  *, ub2)) \
  (Pen_Vector[PEN_GETFX_INDEX]))
#define PEN_SETFX ((void (*) (void*, ub2, void const *, ub2)) \
  (Pen_Vector[PEN_SETFX_INDEX]))
#define PEN_MOVX ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MOVX_INDEX]))
#define PEN_MOVXN ((void (*) (void*, void const *, const ub1, const ub1, void *)) \
  (Pen_Vector[PEN_MOVXN_INDEX]))
#define PEN_EXTX ((void (*) (void*, void const *,  ub4)) \
  (Pen_Vector[PEN_EXTX_INDEX]))
#define PEN_INMDH_CHAR ((void (*) (void*, void  *, ub1, ub4, ub1, ub1)) \
  (Pen_Vector[PEN_INMDH_CHAR_INDEX]))
#define PEN_INMDH_LOB ((void (*) (void*, void  *, ub1,  ub1)) \
  (Pen_Vector[PEN_INMDH_LOB_INDEX]))
#define PEN_INMDH_DATETIME ((void (*) (void*, void  *, ub1,  ub1)) \
  (Pen_Vector[PEN_INMDH_DATETIME_INDEX]))
#define PEN_INMDH_INTERVAL ((void (*) (void*, void  *, ub1,  ub1, ub1)) \
(Pen_Vector[PEN_INMDH_INTERVAL_INDEX]))
#define PEN_INMDH_ADT ((void (*) (void*, void  *, ub4)) \
  (Pen_Vector[PEN_INMDH_ADT_INDEX]))
#define PEN_INMDH_INDEXED_SSCALAR ((void (*) (void*, void  *, ub4, ub1, void*)) \
  (Pen_Vector[PEN_INMDH_INDEXED_SSCALAR_INDEX]))
#define PEN_INMDH_INDEXED_OBJREF ((void (*) (void*, void  *, ub4, ub1, void*, ub4)) \
  (Pen_Vector[PEN_INMDH_INDEXED_OBJREF_INDEX]))
#define PEN_INMDH_INDEXED_OPQ ((void (*) (void*, void  *, ub4, ub1, void*, ub4)) \
  (Pen_Vector[PEN_INMDH_INDEXED_OPQ_INDEX]))
#define PEN_INMDH_INDEXED_INDEXED ((void (*) (void*, void  *, ub4, ub1, void*, ub4)) \
  (Pen_Vector[PEN_INMDH_INDEXED_INDEXED_INDEX]))
#define PEN_INMDH_INDEXED_ADT ((void (*) (void*, void  *, ub4, ub1, void*, ub4)) \
  (Pen_Vector[PEN_INMDH_INDEXED_ADT_INDEX]))
#define PEN_INMDH_INDEXED_CHAR \
  ((void (*) (void*, void  *, ub4, ub1, void*, ub1, ub4, ub1)) \
  (Pen_Vector[PEN_INMDH_INDEXED_CHAR_INDEX]))
#define PEN_INMDH_INDEXED_UROWID \
  ((void (*) (void*, void  *, ub4, ub1, void*, ub1, ub4, ub1)) \
  (Pen_Vector[PEN_INMDH_INDEXED_UROWID_INDEX]))
#define PEN_INMDH_INDEXED_LOB \
  ((void (*) (void*, void  *, ub4, ub1, void*, ub1, ub1)) \
  (Pen_Vector[PEN_INMDH_INDEXED_LOB_INDEX]))
#define PEN_INMDH_INDEXED_DATETIME \
  ((void (*) (void*, void  *, ub4, ub1, void*, ub1, ub1)) \
  (Pen_Vector[PEN_INMDH_INDEXED_DATETIME_INDEX]))
#define PEN_INMDH_INDEXED_INTERVAL \
  ((void (*) (void*, void  *, ub4, ub1, void*, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INMDH_INDEXED_INTERVAL_INDEX]))
#define PEN_INMDH_OPQ ((void (*) (void*, void  *, ub4)) (Pen_Vector[PEN_INMDH_OPQ_INDEX]))
#define PEN_INMDH_OBJREF ((void (*) (void*, void  *, ub4)) (Pen_Vector[PEN_INMDH_OBJREF_INDEX]))
#define PEN_INHFA_COMMON \
  ((void (*) (void*, void  const*, void *, ub4, ...)) \
  (Pen_Vector[PEN_INHFA_COMMON_INDEX]))
#define PEN_INHFA1_COMMON ((void (*) (void*, void const *, void *, ub4)) \
  (Pen_Vector[PEN_INHFA1_COMMON_INDEX]))
#define PEN_INHFA_FCHAR \
  ((void (*) (void*, void const *, void *, ub1, ub4, ub1, ub1)) \
  (Pen_Vector[PEN_INHFA_FCHAR_INDEX]))
#define PEN_INHFA_LOB ((void (*) (void*, void const *, void *, ub1, ub1)) \
  (Pen_Vector[PEN_INHFA_LOB_INDEX]))
#define PEN_INHFA_OBJREF ((void (*) (void*, void const *, void *, ub4)) \
  (Pen_Vector[PEN_INHFA_OBJREF_INDEX]))
#define PEN_INHFA_DATETIME ((void (*) (void*, void const *, void *, ub1, ub1)) \
  (Pen_Vector[PEN_INHFA_DATETIME_INDEX]))
#define PEN_INHFA_INTERVAL \
  ((void (*) (void*, void const *, void *, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INHFA_INTERVAL_INDEX]))
#define PEN_INHFA_ADT ((void (*) (void*, void const *, void *, ub4)) \
  (Pen_Vector[PEN_INHFA_ADT_INDEX]))
#define PEN_INHFA_OPQ ((void (*) (void*, void const *, void *, ub4)) \
  (Pen_Vector[PEN_INHFA_OPQ_INDEX]))
#define PEN_INHFA_INDEXED_SSCALAR \
  ((void (*) (void*, void const *, void *, ub4, void *, ub1)) \
  (Pen_Vector[PEN_INHFA_INDEXED_SSCALAR_INDEX]))
#define PEN_INHFA_INDEXED_CHAR \
  ((void (*) (void*, void const *, void *, ub4, void *, ub1, ub1, ub4, ub1)) \
  (Pen_Vector[PEN_INHFA_INDEXED_CHAR_INDEX]))
#define PEN_INHFA_INDEXED_LOB ((void (*) (void*, void const *, void *, ub4, \
  void *, ub1, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INHFA_INDEXED_LOB_INDEX]))
#define PEN_INHFA_INDEXED_DATETIME \
  ((void (*) (void*, void const *, void *, ub4, void *, ub1, ub1, ub1)) \
  (Pen_Vector[PEN_INHFA_INDEXED_DATETIME_INDEX]))
#define PEN_INHFA_INDEXED_INTERVAL ((void (*) (void*, void const *, void *, ub4, void *, ub1, ub1, ub1, ub1)) (Pen_Vector[PEN_INHFA_INDEXED_INTERVAL_INDEX]))
#define PEN_INHFA_INDEXED_ADT \
  ((void (*) (void*, void const *, void *, ub4, void *, ub1, ub4)) \
  (Pen_Vector[PEN_INHFA_INDEXED_ADT_INDEX]))
#define PEN_INHFA_INDEXED_INDEXED \
  ((void (*) (void*, void const *, void *, ub4, void *, ub1, ub4)) \
  (Pen_Vector[PEN_INHFA_INDEXED_INDEXED_INDEX]))
#define PEN_INHFA_INDEXED_OPQ \
  ((void (*) (void*, void const *, void *, ub4, void *, ub1, ub4)) \
  (Pen_Vector[PEN_INHFA_INDEXED_OPQ_INDEX]))
#define PEN_INHFA_INDEXED_OBJREF \
  ((void (*) (void*, void const *, void *, ub4, void *, ub1, ub4)) \
  (Pen_Vector[PEN_INHFA_INDEXED_OBJREF_INDEX]))
#define PEN_TREAT ((void (*) (void*, void const *, ub4, ub1, void *)) \
  (Pen_Vector[PEN_TREAT_INDEX]))
#define PEN_CMPIO ((void (*) (void*, void const *,  ub4, ub1, void*)) \
  (Pen_Vector[PEN_CMPIO_INDEX]))
#define PEN_ABSN ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_ABSN_INDEX]))
#define PEN_ISNULL ((void (*) (void*, const ub1, void const *, void *)) \
  (Pen_Vector[PEN_ISNULL_INDEX]))
#define PEN_NULCHK ((void (*) (void*, const ub1, void const *)) \
  (Pen_Vector[PEN_NULCHK_INDEX]))
#define PEN_RNGCHKI \
  ((void (*) (void*, const ub1, void const *, void const*, void const *)) \
  (Pen_Vector[PEN_RNGCHKI_INDEX]))
#define PEN_RNGCHKF \
  ((void (*) (void*, const ub1, void const *, void const*, void const *)) \
  (Pen_Vector[PEN_RNGCHKF_INDEX]))
#define PEN_ANDB ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_ANDB_INDEX]))
#define PEN_ORB ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_ORB_INDEX]))
#define PEN_NOTB ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_NOTB_INDEX]))
#define PEN_CHSNULL \
  ((void (*) (void*, const ub2, void const *, void const *,void const *, void *)) \
  (Pen_Vector[PEN_CHSNULL_INDEX]))
#define PEN_NVL(ctx, nvl_code, src1, src2, dst) \
  PEN_CHSNULL((ctx), (nvl_code), (src1), (src2), (src1), (dst))
#define PEN_REL2BOOL \
  ((void (*) (void*, const ub1, void const *, void const *, void *)) \
  (Pen_Vector[PEN_REL2BOOL_INDEX]))
#define PEN_MINMAX\
  ((void (*) (void*, const ub1, void const *, void const *, void *)) \
  (Pen_Vector[PEN_MINMAX_INDEX]))
#define PEN_ADDD \
  ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_ADDD_INDEX]))
#define PEN_ADDF \
  ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_ADDF_INDEX]))
#define PEN_SUBD \
  ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_SUBD_INDEX]))
#define PEN_SUBF \
  ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_SUBF_INDEX]))
#define PEN_MULD \
  ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_MULD_INDEX]))
#define PEN_MULF \
  ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_MULF_INDEX]))
#define PEN_DIVD \
  ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_DIVD_INDEX]))
#define PEN_DIVF \
  ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_DIVF_INDEX]))
#define PEN_NEGD \
  ((void (*) (void*, void const *, void *)) (Pen_Vector[PEN_NEGD_INDEX]))
#define PEN_NEGF \
  ((void (*) (void*, void const *, void *)) (Pen_Vector[PEN_NEGF_INDEX]))
#define PEN_ABSD \
  ((void (*) (void*, void const *, void *)) (Pen_Vector[PEN_ABSD_INDEX]))
#define PEN_ABSF \
  ((void (*) (void*, void const *, void *)) (Pen_Vector[PEN_ABSF_INDEX]))
#define PEN_MOVDBL \
  ((void (*) (void*, void const *, void *)) (Pen_Vector[PEN_MOVDBL_INDEX]))
#define PEN_MOVFLT \
  ((void (*) (void*, void const *, void *)) (Pen_Vector[PEN_MOVFLT_INDEX]))
#define PEN_CMP3DBL ((pevm_excs (*) (void*, void const *, void const*)) \
  (Pen_Vector[PEN_CMP3DBL_INDEX]))
#define PEN_CMP3FLT ((pevm_excs (*) (void*, void const *, void const *)) \
  (Pen_Vector[PEN_CMP3FLT_INDEX]))
#define PEN_VATTR ((void (*) (void*, const ub1, void const *, void *)) \
  (Pen_Vector[PEN_VATTR_INDEX]))
#define PEN_FTCHC_PSEUDO ((void (*) (void*, void const *)) \
  (Pen_Vector[PEN_FTCHC_PSEUDO_INDEX]))
#define PEN_VALIST ((void (*) (void*, const ub2, void  *, void *)) \
  (Pen_Vector[PEN_VALIST_INDEX]))
#define PEN_VALISTINI ((void (*) (void*, const ub4, void *)) \
  (Pen_Vector[PEN_VALISTINI_INDEX]))
#define PEN_VCAL ((void (*) (void*, const ub1, const ub1, void **)) \
  (Pen_Vector[PEN_VCAL_INDEX]))
#define PEN_OVER ((void (*) \
  (void*, ub2, void const *, void const *,void const *,void const *,void *)) \
  (Pen_Vector[PEN_OVER_INDEX]))
#define PEN_REGEXP_INSTR_CLB \
  ((void (*) (void*, void *, void *, void *, void*, void*,void*)) \
  (Pen_Vector[PEN_REGEXP_INSTR_CLB_INDEX]))
#define PEN_REGEXP_INSTR_TXT \
  ((void (*) (void*, void *, void *, void *, void*, void*, void*)) \
  (Pen_Vector[PEN_REGEXP_INSTR_TXT_INDEX]))
#define PEN_REGEXP_LIKE_CLB \
  ((void (*) (void*, void *, void *, void *)) \
  (Pen_Vector[PEN_REGEXP_LIKE_CLB_INDEX]))
#define PEN_REGEXP_LIKE_TXT \
  ((void (*) (void*, void *, void *, void *)) \
  (Pen_Vector[PEN_REGEXP_LIKE_TXT_INDEX]))
#define PEN_REGEXP_REPLACE_CLB \
  ((void (*) (void*, void *, void *, void *, void*, void*,void*)) \
  (Pen_Vector[PEN_REGEXP_REPLACE_CLB_INDEX]))
#define PEN_REGEXP_REPLACE_CLB2 \
  ((void (*) (void*, void *, void *, void *, void *, void *, void *)) \
  (Pen_Vector[PEN_REGEXP_REPLACE_CLB2_INDEX]))
#define PEN_REGEXP_REPLACE_TXT \
  ((void (*) (void*, void *, void *, void *, void*, void*, void *)) \
  (Pen_Vector[PEN_REGEXP_REPLACE_TXT_INDEX]))
#define PEN_REGEXP_SUBSTR_CLB \
  ((void (*) (void*, void *, void *, void *, void*, void*)) \
  (Pen_Vector[PEN_REGEXP_SUBSTR_CLB_INDEX]))
#define PEN_REGEXP_SUBSTR_TXT \
  ((void (*) (void*, void *, void *, void *, void*, void*)) \
  (Pen_Vector[PEN_REGEXP_SUBSTR_TXT_INDEX]))
#define PEN_REGEXP_COUNT_CLB \
  ((void (*) (void*, void *, void *, void *, void*)) \
  (Pen_Vector[PEN_REGEXP_COUNT_CLB_INDEX]))
#define PEN_REGEXP_COUNT_TXT \
  ((void (*) (void*, void *, void *, void *, void*)) \
  (Pen_Vector[PEN_REGEXP_COUNT_TXT_INDEX]))
#define PEN_REGEXP_INSTR_CLB2 \
  ((void (*) (void*, void *, void *, void *, void*, void*, void*, void*)) \
  (Pen_Vector[PEN_REGEXP_INSTR_CLB2_INDEX]))
#define PEN_REGEXP_INSTR_TXT2 \
  ((void (*) (void*, void *, void *, void *, void*, void*, void*, void*)) \
  (Pen_Vector[PEN_REGEXP_INSTR_TXT2_INDEX]))
#define PEN_REGEXP_SUBSTR_CLB2 \
  ((void (*) (void*, void *, void *, void *, void*, void*, void*)) \
  (Pen_Vector[PEN_REGEXP_SUBSTR_CLB2_INDEX]))
#define PEN_REGEXP_SUBSTR_TXT2 \
  ((void (*) (void*, void *, void *, void *, void*, void*, void*)) \
  (Pen_Vector[PEN_REGEXP_SUBSTR_TXT2_INDEX]))
#define PEN_RCPAT ((void (*) (void*, void *, void *, ub1, void *)) \
  (Pen_Vector[PEN_RCPAT_INDEX]))
#define PEN_INSI_RCPAT ((void (*) (void*, void *, plsmut *,void *, ub1)) \
  (Pen_Vector[PEN_INSI_RCPAT_INDEX]))
#define PEN_RAISE_JUMP ((void (*) (void*)) \
  (Pen_Vector[PEN_RAISE_JUMP_INDEX]))
#define PENSXP_SEARCH_EXCEPTION ((ub4 (*) (void*, ub4, ub4 *)) \
  (Pen_Vector[PENSXP_SEARCH_EXCEPTION_INDEX]))
#define PEN_UNHNDLD ((pevm_excs (*) (void*)) (Pen_Vector[PEN_UNHNDLD_INDEX]))
#define PEN_CTRLC ((void  (*) (void *)) (Pen_Vector[PEN_CTRLC_INDEX]))
#define PEN_CALL_SETUP ((void  (*) (void *, pemtshd **)) \
  (Pen_Vector[PEN_CALL_SETUP_INDEX]))
#define PEN_INST ((void  (*) (void *, ub2, ub1)) (Pen_Vector[PEN_INST_INDEX]))
#define PEN_XCAL(ctx,did,ept,arg_block) \
  ((void  (*) (void *, ub2, ub2, pemtshd **, boolean)) \
  (Pen_Vector[PEN_XCAL_I_INDEX]))((ctx),(did),(ept),(arg_block),TRUE)
#define PEN_SCAL(ctx,did,ept,arg_block) \
  ((void  (*) (void *, ub2, ub2, pemtshd **, boolean)) \
  (Pen_Vector[PEN_XCAL_I_INDEX]))((ctx),(did),(ept),(arg_block),FALSE)


#define PEN_INSROW ((void (*) (void *, void *, void *, ub2)) \
  (Pen_Vector[PEN_INSROW_INDEX]))
#define PEN_INSERT ((void (*) (void *, void *, void *, ub2)) \
  (Pen_Vector[PEN_INSERT_INDEX]))
#define PEN_DSELBEG ((void (*) (void *, void *, void *, ub2)) \
  (Pen_Vector[PEN_DSELBEG_INDEX]))
#define PEN_XSELBEG ((void (*) (void *, void *, void *, ub2)) \
  (Pen_Vector[PEN_XSELBEG_INDEX]))
#define PEN_UPDATE ((void (*) (void *, void *, void *, ub2)) \
  (Pen_Vector[PEN_UPDATE_INDEX]))
#define PEN_STMEND ((void (*) (void *, void *, void *)) \
  (Pen_Vector[PEN_STMEND_INDEX]))
#define PEN_DSELNEXT ((void (*) (void *, void *, void *)) \
  (Pen_Vector[PEN_DSELNEXT_INDEX]))
#define PEN_DSELRONEXT ((void (*) (void *, void *, void *, void *, void *)) \
  (Pen_Vector[PEN_DSELRONEXT_INDEX]))
#define PEN_DSELEND ((void (*) (void *, void *, void *)) \
  (Pen_Vector[PEN_DSELEND_INDEX]))
#define PEN_DSELBYRID ((void (*) (void *, void *, void *)) \
  (Pen_Vector[PEN_DSELBYRID_INDEX]))
#define PEN_XSELNEXT ((void (*) (void *, void *, void *)) \
  (Pen_Vector[PEN_XSELNEXT_INDEX]))
#define PEN_XSELEND ((void (*) (void *, void *, void *)) \
  (Pen_Vector[PEN_XSELEND_INDEX]))
#define PEN_INSBEG ((void (*) (void *, void *, void *, void *, ub2)) \
  (Pen_Vector[PEN_INSBEG_INDEX]))
#define PEN_INSEND ((void (*) (void *, void *, void *)) \
  (Pen_Vector[PEN_INSEND_INDEX]))
#define PEN_STMBEG ((void (*) (void *, void *, void *)) \
  (Pen_Vector[PEN_STMBEG_INDEX]))

/* bug 5212512: on IA64 port, when using C native, we need to
 * generate a direct call to setjmp, else the C compiler generates
 * incorrect exception handler code.
 */
# if defined (_IA64_) || defined (__ia64__)
#define PEN_JMPSET pevm_jmpset
#else
#define PEN_JMPSET(p) \
  SPEN_JMPSET (((int (*) (pevm_jmpbuf*))(Pen_Vector[PEN_JMPSET_INDEX])),p)
#endif /* _IA64_ || LINUX_IA64 */

#define PEN_JMPBUF_ALLOC ((void (*) (void *, pen_buffer **, size_t)) \
  (Pen_Vector[PEN_JMPBUF_ALLOC_INDEX]))
#define PEN_JMPBUF ((void (*) (void *, pen_buffer *)) \
  (Pen_Vector[PEN_JMPBUF_INDEX]))
#define PEN_FIELDS ((void (*) (void *, pevmea_enter_args *)) \
  (Pen_Vector[PEN_FIELDS_INDEX]))
#define PEN_CHK_CTRL_BRK(ctx) \
do {if (--(((pvm_ctx_pub *)ctx)->ctlc_cnt) <= 0) PEN_CTRLC(ctx); } while (0)
#define PEN_MOVC(ctx, src1, dst) PEN_MOVC_I(ctx, (ub1)MOVC, src1, dst)
#define PEN_CMP3D(ctx,src1,src2) PEN_CMP3D_I(ctx, CMP3D, src1, src2)
#define PEN_CMP3DTM(ctx,src1,src2) PEN_CMP3D_I(ctx, CMP3DTM, src1, src2)
#define PEN_CMP3ITV(ctx,src1,src2) PEN_CMP3D_I(ctx, CMP3ITV, src1, src2)
#define PEN_ADFNUC PEN_ADEFINE
#define PEN_ARDEFINE PEN_ADEFINE
#define PEN_CVTNC(ctx, src1, dst) PEN_CVTNFC(ctx, src1, (void *)0, dst)

#define PEN_MODABSI ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MODABSI_INDEX]))
#define PEN_MODADDI ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_MODADDI_INDEX]))
#define PEN_MODMULI ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_MODMULI_INDEX]))
#define PEN_MODNEGI ((void (*) (void*, void const *, void *)) \
  (Pen_Vector[PEN_MODNEGI_INDEX]))
#define PEN_MODSUBI ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_MODSUBI_INDEX]))
#define PEN_MODINCI ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_MODINCI_INDEX]))
#define PEN_MODDECI ((void (*) (void*, void const *, void const *, void *)) \
  (Pen_Vector[PEN_MODDECI_INDEX]))
#define PEN_ICD_CALL_COMMON \
  ((pevm_excs (*) (void *, ub2, boolean, ub2, ub2, boolean, void **)) \
  (Pen_Vector[PEN_ICD_CALL_COMMON_INDEX]))
#define PEN_BCAL(ctx, loc, argc, arg_block) \
  PEN_ICD_CALL_COMMON \
  ((ctx), 0, 0, (loc), (argc), TRUE, ((void **)(arg_block))+1)

#define PEN_ICAL ((void (*) (void *, ub2, ub2, ub2, ub2, pemtshd **)) \
  (Pen_Vector[PEN_ICAL_INDEX]))

#define PEN_BDCINI_COLL(ctx, src1, bdflags, arrhdl) \
  PEN_BDCINI_I((ctx), (src1), (bdflags), arrhdl)

#define PEN_BDCINI(ctx, src1, bdflags) \
  PEN_BDCINI_I((ctx), (src1), (bdflags), (void *) 0)

#define PEN_PCLABELGET \
  ((ub4  (*) (void *, ub2, ub2, void *, ub1 ***, ub4 **)) \
  (Pen_Vector[PEN_PCLABELGET_INDEX]))

#define PEN_PCLABELSET \
  ((void  (*) (void *, ub4, ub4)) (Pen_Vector[PEN_PCLABELSET_INDEX]))

#define PEN_BCTR \
  ((boolean  (*) (void const *, void const *)) (Pen_Vector[PEN_BCTR_INDEX]))



#else

#define PEN_BRREINI pevm_BRREINI
#define PEN_BRRESTORE pevm_BRRESTORE
#define PEN_ABSI pevm_ABSI
#define PEN_ADDI pevm_ADDI
#define PEN_ADDN pevm_ADDN
#define PEN_BNDUC pevm_BNDUC
#define PEN_BREAK pevm_BREAK
#define PEN_BFTCHC pevm_BFTCHC
#define PEN_FTCHC pevm_FTCHC
#define PEN_CLREX pevm_CLREX
#define PEN_RASRX pevm_RASRX
#define PEN_CBEG pevm_CBEG
#define PEN_CSBEG pevm_CSBEG
#define PEN_CMP3C pevm_CMP3C
#define PEN_CMP3D(ctx,src1,src2) pevm_CMP3D (ctx, CMP3D, src1, src2)
#define PEN_CMP3DTM(ctx,src1,src2) pevm_CMP3D(ctx, CMP3DTM, src1, src2)
#define PEN_CMP3ITV(ctx,src1,src2) pevm_CMP3D(ctx, CMP3ITV, src1, src2)
#define PEN_CMP3I pevm_CMP3I
#define PEN_CMP3N pevm_CMP3N
#define PEN_CMP3R pevm_CMP3R
#define PEN_CMP3LOB pevm_CMP3LOB
#define PEN_CMP3REF pevm_CMP3REF
#define PEN_CMP3UR pevm_CMP3UR
#define PEN_CNVMSC pevm_CNVMSC
#define PEN_CONCN pevm_CONCN
#define PEN_CVTCFD pevm_CVTCFD
#define PEN_CVTCD(ctx, src1, dst) pevm_CVTCFD(ctx, src1, (void *)0, dst)
#define PEN_CVTCFL pevm_CVTCFL
#define PEN_CVTCL(ctx, src1, dst) pevm_CVTCFL(ctx, src1, (void *)0, dst)
#define PEN_CVTCI(ctx, src1, dst) pevm_CVTCI_i(ctx, src1, dst, TRUE)
#define PEN_CVTCN pevm_CVTCN
#define PEN_CVTCUR pevm_CVTCUR
#define PEN_CVTDFC pevm_CVTDFC
#define PEN_CVTDC(ctx, src1, dst) pevm_CVTDFC(ctx, src1, (void *)0, dst)
#define PEN_CVTEI pevm_CVTEI
#define PEN_CVTHR pevm_CVTHR
#define PEN_CVTIC pevm_CVTIC
#define PEN_CVTIE pevm_CVTIE
#define PEN_CVTIN pevm_CVTIN
#define PEN_CVTLFC pevm_CVTLFC
#define PEN_CVTLC(ctx, src1, dst) pevm_CVTLFC(ctx, src1, (void *)0, dst)
#define PEN_CVTNFC pevm_CVTNFC
#define PEN_CVTNC(ctx, src1, dst) pevm_CVTNFC(ctx, src1, (void *)0, dst)
#define PEN_CVTNI(ctx, src1, dst) pevm_CVTCI_i(ctx, src1, dst, FALSE)
#define PEN_CVTRH pevm_CVTRH
#define PEN_CVTURC pevm_CVTURC
#define PEN_DECI pevm_DECI
#define PEN_DIVN pevm_DIVN
#define PEN_EXECC pevm_EXECC
#define PEN_I4EXIM pevm_I4EXIM
#define PEN_EXIM pevm_EXIM
#define PEN_I4OPND pevm_I4OPND
#define PEN_OPND pevm_OPND
#define PEN_INCI pevm_INCI
#define PEN_INITX pevm_INITX
#define PEN_JUNK2 pevm_BREAK /* Not ever generated. */
#define PEN_MOVADT pevm_MOVADT
#define PEN_MOVC (ctx, src1, dst) pevm_MOVC_i(ctx, (ub1)MOVC, src1, dst)
#define PEN_MOVCB(ctx, src1, dst) pevm_MOVC_i(ctx, (ub1)MOVCB, src1, dst)
#define PEN_MOVFCU(ctx, src1, dst) pevm_MOVC_i(ctx, (ub1)MOVFCU, src1, dst)
#define PEN_MOVCR pevm_MOVCR
#define PEN_MOVD pevm_MOVD
#define PEN_MOVDTM pevm_MOVDTM
#define PEN_MOVI pevm_MOVI
#define PEN_MOVITV pevm_MOVITV
#define PEN_MOVLOB pevm_MOVLOB
#define PEN_MOVN pevm_MOVN
#define PEN_MOVNU pevm_MOVNU
#define PEN_MOVOPQ pevm_MOVOPQ
#define PEN_MOVRAW pevm_MOVRAW
#define PEN_MOVREF pevm_MOVREF
#define PEN_MOVRPAT pevm_MOVRPAT
#define PEN_MOVSELFA pevm_MOVSELFA
#define PEN_MOVUR pevm_MOVUR
#define PEN_MULI pevm_MULI
#define PEN_MSET_ADT pevm_MSET_ADT
#define PEN_MSET pevm_MSET
#define PEN_MULN pevm_MULN
#define PEN_NCAL pevm_NCAL
#define PEN_SNCAL pevm_SNCAL
#define PEN_DCAL(ctx, did, ept, vti,  arg_block) \
  pevm_DCAL((ctx), (ept), (vti), (ub1 **)0, (void **)(arg_block))
#define PEN_NEGI pevm_NEGI
#define PEN_NEGN pevm_NEGN
#define PEN_PATXS pevm_PATXS
#define PEN_PIPE pevm_PIPE
#define PEN_PRFTC pevm_PRFTC
#define PEN_RASIX pevm_RASIX
#define PEN_RASUX pevm_RASUX
#define PEN_RCAL pevm_RCAL
#define PEN_JUNK3 pevm_BREAK /* Not ever generated. */
#define PEN_SETN pevm_SETN
#define PEN_SUBI pevm_SUBI
#define PEN_SUBN pevm_SUBN
#define PEN_SUBSTR pevm_SUBSTR
#define PEN_TSTREF pevm_TSTREF
#define PEN_XORI pevm_XORI
#define PEN_INSI_SCALAR_ pevm_INSI_SCALAR_
#define PEN_INSI_CURSREF_ pevm_INSI_CURSREF_
#define PEN_INSI_UROWID pevm_INSI_UROWID
#define PEN_INSI_CHAR pevm_INSI_CHAR
#define PEN_INSI_LOB pevm_INSI_LOB
#define PEN_INSI_DATETIME pevm_INSI_DATETIME
#define PEN_INSI_INTERVAL pevm_INSI_INTERVAL
#define PEN_INSI_ADT pevm_INSI_ADT
#define PEN_INSI_OPQ pevm_INSI_OPQ
#define PEN_INSI_OBJREF pevm_INSI_OBJREF
#define PEN_INSI_INDEXED_SSCALAR pevm_INSI_INDEXED_SSCALAR
#define PEN_INSI_INDEXED_CHAR pevm_INSI_INDEXED_CHAR
#define PEN_INSI_INDEXED_LOB pevm_INSI_INDEXED_LOB
#define PEN_INSI_INDEXED_DATETIME pevm_INSI_INDEXED_DATETIME
#define PEN_INSI_INDEXED_INTERVAL pevm_INSI_INDEXED_INTERVAL
#define PEN_INSI_INDEXED_ADT pevm_INSI_INDEXED_ADT
#define PEN_INSI_INDEXED_OPQ pevm_INSI_INDEXED_OPQ
#define PEN_INSI_INDEXED_OBJREF pevm_INSI_INDEXED_OBJREF
#define PEN_INSI_INDEXED_INDEXED pevm_INSI_INDEXED_INDEXED
#define PEN_INBI_CURSREF pevm_INBI_CURSREF
#define PEN_INBI_UROWID pevm_INBI_UROWID
#define PEN_INBI_CHAR pevm_INBI_CHAR
#define PEN_INBI_LOB pevm_INBI_LOB
#define PEN_INBI_DATETIME pevm_INBI_DATETIME
#define PEN_INBI_INTERVAL pevm_INBI_INTERVAL
#define PEN_INBI_ADT pevm_INBI_ADT
#define PEN_INBI_OPQ pevm_INBI_OPQ
#define PEN_INBI_OBJREF pevm_INBI_OBJREF
#define PEN_INBI_INDEXED_SSCALAR pevm_INBI_INDEXED_SSCALAR
#define PEN_INBI_INDEXED_UROWID pevm_INBI_INDEXED_UROWID
#define PEN_INBI_INDEXED_CHAR pevm_INBI_INDEXED_CHAR
#define PEN_INBI_INDEXED_DATETIME pevm_INBI_INDEXED_DATETIME
#define PEN_INBI_INDEXED_INTERVAL pevm_INBI_INDEXED_INTERVAL
#define PEN_INBI_INDEXED_LOB pevm_INBI_INDEXED_LOB
#define PEN_INBI_INDEXED_ADT pevm_INBI_INDEXED_ADT
#define PEN_INBI_INDEXED_OPQ pevm_INBI_INDEXED_OPQ
#define PEN_INBI_INDEXED_OBJREF pevm_INBI_INDEXED_OBJREF
#define PEN_INBI_INDEXED_INDEXED pevm_INBI_INDEXED_INDEXED
#define PEN_CCNST pevm_CCNST
#define PEN_INSTC2 pevm_INSTC2
#define PEN_CCSINF pevm_CCSINF
#define PEN_EXCOD pevm_EXCOD
#define PEN_EXMSG pevm_EXMSG
#define PEN_CLOSC pevm_CLOSC
#define PEN_BIND pevm_BIND
#define PEN_DEFINE pevm_DEFINE
#define PEN_FCAL pevm_FCAL
#define PEN_ADEFINE pevm_ADEFINE
#define PEN_ADFNUC pevm_ADEFINE
#define PEN_ARDEFINE pevm_ADEFINE
#define PEN_BDCINI_I pevm_BDCINI_i
#define PEN_BDCINI(ctx, src1, bdflags) \
  pevm_BDCINI_i((ctx), (src1), (bdflags), (void *) 0)
#define pen_BDCINI_COLL(ctx, src1, bdflags, arrhdl) \
  pevm_BDCINI_i((ctx), (src1), (bdflags), (arrhdl))
#define PEN_ARGEASCA pevm_ARGEASCA
#define PEN_ARGECOLL pevm_ARGECOLL
#define PEN_ARGEIBBI pevm_ARGEIBBI
#define PEN_ARPEASCA pevm_ARPEASCA
#define PEN_ARPECOLL pevm_ARPECOLL
#define PEN_ARPEIBBI pevm_ARPEIBBI
#define PEN_BCNSTR pevm_BCNSTR
#define PEN_RET pevm_RET
#define PEN_RNDDC_I pevm_RNDDC_i
#define PEN_RNDD(ctx, src1, dst) pevm_RNDDC_i(ctx, src1, (void *)0, dst, TRUE)
#define PEN_RNDDC(ctx, src1, src2, dst) pevm_RNDDC_i(ctx, src1,  src2, dst, TRUE)
#define PEN_TRND(ctx, src1, dst) pevm_RNDDC_i(ctx, src1,  (void *)0, dst, FALSE)
#define PEN_TRNDC(ctx, src1, src2, dst) pevm_RNDDC_i(ctx, src1,  src2, dst, FALSE)
#define PEN_LSTD pevm_LSTD
#define PEN_ADDDN_I pevm_ADDDN_i
#define PEN_ADDDN(ctx, src1, src2, dst) pevm_ADDDN_i(ctx, src1, src2, dst, FALSE)
#define PEN_SUBDN(ctx, src1, src2, dst) pevm_ADDDN_i(ctx, src1, src2, dst, TRUE)
#define PEN_SUBDD pevm_SUBDD
#define PEN_ADDMDN pevm_ADDMDN
#define PEN_MBTD pevm_MBTD
#define PEN_NXTD pevm_NXTD
#define PEN_ENTER pevm_ENTER
#define PEN_ENTERX  pevm_ENTERX
#define PEN_BNDS pevm_BNDS
#define PEN_COPN pevm_COPN
#define PEN_GBCR pevm_GBCR
#define PEN_CFND pevm_CFND
#define PEN_CSFND pevm_CSFND
#define PEN_CRWC pevm_CRWC
#define PEN_CSRWC pevm_CSRWC
#define PEN_BCRWC pevm_BCRWC
#define PEN_BCSRWC pevm_BCSRWC
#define PEN_GBVAR pevm_GBVAR
#define PEN_SBVAR pevm_SBVAR
#define PEN_GBEX pevm_GBEX
#define PEN_SBEX pevm_SBEX
#define PEN_GETFX pevm_GETFX
#define PEN_SETFX pevm_SETFX
#define PEN_MOVX pevm_MOVX
#define PEN_EXTX pevm_EXTX
#define PEN_INMDH_CHAR pevm_INMDH_CHAR
#define PEN_INMDH_LOB pevm_INMDH_LOB
#define PEN_INMDH_DATETIME pevm_INMDH_DATETIME
#define PEN_INMDH_INTERVAL pevm_INMDH_INTERVAL
#define PEN_INMDH_ADT pevm_INMDH_ADT
#define PEN_INMDH_INDEXED_SSCALAR pevm_INMDH_INDEXED_SSCALAR
#define PEN_INMDH_INDEXED_OBJREF pevm_INMDH_INDEXED_OBJREF
#define PEN_INMDH_INDEXED_OPQ pevm_INMDH_INDEXED_OPQ
#define PEN_INMDH_INDEXED_INDEXED pevm_INMDH_INDEXED_INDEXED
#define PEN_INMDH_INDEXED_ADT pevm_INMDH_INDEXED_ADT
#define PEN_INMDH_INDEXED_CHAR pevm_INMDH_INDEXED_CHAR
#define PEN_INMDH_INDEXED_UROWID pevm_INMDH_INDEXED_UROWID
#define PEN_INMDH_INDEXED_LOB pevm_INMDH_INDEXED_LOB
#define PEN_INMDH_INDEXED_DATETIME pevm_INMDH_INDEXED_DATETIME
#define PEN_INMDH_INDEXED_INTERVAL pevm_INMDH_INDEXED_INTERVAL
#define PEN_INMDH_OPQ pevm_INMDH_OPQ
#define PEN_INMDH_OBJREF pevm_INMDH_OBJREF
#define PEN_INHFA_COMMON pevm_INHFA_COMMON
#define PEN_INHFA1_COMMON pevm_INHFA1_COMMON
#define PEN_INHFA_FCHAR pevm_INHFA_FCHAR
#define PEN_INHFA_LOB pevm_INHFA_LOB
#define PEN_INHFA_OBJREF pevm_INHFA_OBJREF
#define PEN_INHFA_DATETIME pevm_INHFA_DATETIME
#define PEN_INHFA_INTERVAL pevm_INHFA_INTERVAL
#define PEN_INHFA_ADT pevm_INHFA_ADT
#define PEN_INHFA_OPQ pevm_INHFA_OPQ
#define PEN_INHFA_INDEXED_SSCALAR pevm_INHFA_INDEXED_SSCALAR
#define PEN_INHFA_INDEXED_CHAR pevm_INHFA_INDEXED_CHAR
#define PEN_INHFA_INDEXED_LOB pevm_INHFA_INDEXED_LOB
#define PEN_INHFA_INDEXED_DATETIME pevm_INHFA_INDEXED_DATETIME
#define PEN_INHFA_INDEXED_INTERVAL pevm_INHFA_INDEXED_INTERVAL
#define PEN_INHFA_INDEXED_ADT pevm_INHFA_INDEXED_ADT
#define PEN_INHFA_INDEXED_INDEXED pevm_INHFA_INDEXED_INDEXED
#define PEN_INHFA_INDEXED_OPQ pevm_INHFA_INDEXED_OPQ
#define PEN_INHFA_INDEXED_OBJREF pevm_INHFA_INDEXED_OBJREF
#define PEN_TREAT pevm_TREAT
#define PEN_CMPIO pevm_CMPIO
#define PEN_ABSN pevm_ABSN
#define PEN_JUNK1 pevm_BREAK /* Not ever generated. */
#define PEN_ISNULL pevm_ISNULL
#define PEN_NULCHK pevm_NULCHK
#define PEN_RNGCHKI pevm_RNGCHKI
#define PEN_RNGCHKF pevm_RNGCHKF
#define PEN_ANDB pevm_ANDB
#define PEN_ORB pevm_ORB
#define PEN_NOTB pevm_NOTB
#define PEN_CHSNULL pevm_CHSNULL
#define PEN_NVL(ctx, nvl_code, src1, src2, dst) \
  pevm_CHSNULL((ctx), (nvl_code), (src1), (src2), (src1), (dst))
#define PEN_REL2BOOL pevm_REL2BOOL
#define PEN_MINMAX pevm_MINMAX
#define PEN_ADDD pevm_ADDD
#define PEN_ADDF pevm_ADDF
#define PEN_SUBD pevm_SUBD
#define PEN_SUBF pevm_SUBF
#define PEN_MULD pevm_MULD
#define PEN_MULF pevm_MULF
#define PEN_DIVD pevm_DIVD
#define PEN_DIVF pevm_DIVF
#define PEN_NEGD pevm_NEGD
#define PEN_NEGF pevm_NEGF
#define PEN_ABSD pevm_ABSD
#define PEN_ABSF pevm_ABSF
#define PEN_MOVDBL pevm_MOVDBL
#define PEN_MOVFLT pevm_MOVFLT
#define PEN_CMP3DBL pevm_CMP3DBL
#define PEN_CMP3FLT pevm_CMP3FLT
#define PEN_VATTR pevm_VATTR
#define PEN_FTCHC_PSEUDO pevm_FTCHC_PSEUDO
#define PEN_VALIST pevm_VALIST
#define PEN_VALISTINI pevm_VALISTINI
#define PEN_VCAL pevm_VCAL
#define PEN_OVER pevm_OVER
#define PEN_REGEXP_INSTR_CLB pevm_REGEXP_INSTR_CLB
#define PEN_REGEXP_INSTR_TXT pevm_REGEXP_INSTR_TXT
#define PEN_REGEXP_LIKE_CLB pevm_REGEXP_LIKE_CLB
#define PEN_REGEXP_LIKE_TXT pevm_REGEXP_LIKE_TXT
#define PEN_REGEXP_REPLACE_CLB pevm_REGEXP_REPLACE_CLB
#define PEN_REGEXP_REPLACE_CLB2 pevm_REGEXP_REPLACE_CLB2
#define PEN_REGEXP_REPLACE_TXT pevm_REGEXP_REPLACE_TXT
#define PEN_REGEXP_SUBSTR_CLB pevm_REGEXP_SUBSTR_CLB
#define PEN_REGEXP_SUBSTR_TXT pevm_REGEXP_SUBSTR_TXT
#define PEN_REGEXP_COUNT_CLB pevm_REGEXP_COUNT_CLB
#define PEN_REGEXP_COUNT_TXT pevm_REGEXP_COUNT_TXT
#define PEN_REGEXP_INSTR_CLB2 pevm_REGEXP_INSTR_CLB2
#define PEN_REGEXP_INSTR_TXT2 pevm_REGEXP_INSTR_TXT2
#define PEN_REGEXP_SUBSTR_CLB2 PEN_REGEXP_SUBSTR_CLB2
#define PEN_REGEXP_SUBSTR_TXT2 PEN_REGEXP_SUBSTR_TXT2
#define PEN_RCPAT pevm_RCPAT
#define PEN_INSI_RCPAT pevm_INSI_RCPAT
#define PEN_RAISE_JUMP pevm_RAISE_JUMP
#define PENSXP_SEARCH_EXCEPTION_INDEX
#define PEN_UNHNDLD pen_UNHNDLD
#define PEN_CTRLC pevm_CTRLC
#define PEN_CALL_SETUP pevm_CALL_SETUP
#define PEN_INST pevm_INST
#define PEN_XCAL(ctx, did, ept, arg_block) \
        pen_XCAL_i((ctx), (did), (ept), (arg_block), TRUE)
#define PEN_SCAL(ctx, did, ept, arg_block) \
        pen_XCAL_i((ctx), (did), (ept), (arg_block), FALSE)

#define PEN_JMPBUF_ALLOC pevm_JMPBUF_ALLOC
#define PEN_XCAL_I pevm_XCAL_i
#define PEN_JMPSET pevm_jmpset
#define PEN_JMPBUF pevm_jmpbuf
#define PEN_FIELDS pevm_FIELDS
#define PEN_CHK_CTRL_BRK(ctx) \
do {if (--(((pvm_ctx_pub *)ctx)->ctlc_cnt) <= 0) pen_CTRLC(ctx); } while (0)
#define PEN_ICD_CALL_COMMON pevm_ICD_CALL_COMMON
#define PEN_BCAL(ctx, loc, argc, arg_block) \
  pevm_icd_call_common \
  ((ctx), 0, 0, (loc), (argc), TRUE, ((void **)(arg_block))+1)
#define PEN_ICAL pevm_ICAL
#define PEN_PCLABELGET pevm_PCLABELGET
#define PEN_PCLABELSET pevm_PCLABELSET
#define PEN_BCTR pevm_BCTR
#define PEN_MODABSI pevm_MODABSI
#define PEN_MODADDI pevm_MODADDI
#define PEN_MODMULI pevm_MODMULI
#define PEN_MODNEGI pevm_MODNEGI
#define PEN_MODSUBI pevm_MODSUBI
#define PEN_MOVXN   pevm_MOVXN
#endif

#define PEN_INSI_SCALAR pevm_INSI_SCALAR

#define PEN_INSI_CURSREF pevm_INSI_CURSREF

#define PEN_INBI_ISSCALAR pevm_INSI_ISSCALAR

#define PEN_INBI_OSSCALAR pevm_INSI_OSSCALAR

#define PEN_BREQ pen_BREQ
#define PEN_BRLT pen_BRLT
#define PEN_BRLE pen_BRLE

#define PEN_INSTC3 PEN_INSTC2

#define PEN_INSROW pevm_INSROW
#define PEN_INSERT pevm_INSERT
#define PEN_DSELBEG pevm_DSELBEG
#define PEN_XSELBEG pevm_XSELBEG
#define PEN_UPDATE  pevm_UPDATE
#define PEN_STMEND pevm_STMEND
#define PEN_DSELNEXT pevm_DSELNEXT
#define PEN_DSELRONEXT pevm_DSELRONEXT
#define PEN_DSELEND pevm_DSELEND
#define PEN_DSELBYRID pevm_DSELBYRID
#define PEN_XSELNEXT pevm_XSELNEXT
#define PEN_XSELEND pevm_XSELEND
#define PEN_INSBEG pevm_INSBEG
#define PEN_INSEND pevm_INSEND
#define PEN_STMBEG pevm_STMBEG

#define PEN_INSI_STM pevm_INSI_STM
#define PEN_INSI_DLM pevm_INSI_DLM

/*---------------------------------------------------------------------------
                          PRIVATE FUNCTIONS
 ---------------------------------------------------------------------------*/

#endif                                                         /* PEN_ORACLE */
