/*
 * This file generated on line 445 of /build/atlas-aPz90J/atlas-3.10.2/build/atlas-base/../..//tune/blas/ger/r2hgen.c
 */
#ifndef ATLAS_DSYR2_L2_H
   #define ATLAS_DSYR2_L2_H

#include "atlas_dr2_L2.h"

#define ATL_s2U_NU 1

#define ATL_s2L_NU 1
#define ATL_MIN_RESTRICTED_M 0
#define ATL_URGERK ATL_dger2k__1
#define ATL_GENGERK ATL_dger2k__1

#define ATL_SYR2U_nu(A_, lda_, x_, y_) \
{ \
   TYPE *aa=(A_); \
   ATL_CINT lda0_ = 0; \
   const TYPE x0_=*(x_); \
   const TYPE y0_=*(y_); \
   aa[lda0_+0] += x0_*y0_ + y0_*x0_; \
}
#define ATL_SYR2L_nu(A_, lda_, x_, y_) \
{ \
   TYPE *aa=(A_); \
   ATL_CINT lda0_ = 0; \
   const TYPE x0_=*(x_); \
   const TYPE y0_=*(y_); \
   aa[lda0_+0] += x0_*y0_ + y0_*x0_; \
}

#endif
