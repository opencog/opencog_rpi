#ifndef SMM_H
   #define SMM_H

   #define ATL_mmMULADD
   #define ATL_mmLAT 1
   #define ATL_mmMU  4
   #define ATL_mmNU  4
   #define ATL_mmKU  2
   #define MB 16
   #define NB 16
   #define KB 16
   #define NBNB 256
   #define MBNB 256
   #define MBKB 256
   #define NBKB 256
   #define NB2 32
   #define NBNB2 512

   #define ATL_MulByNB(N_) ((N_) << 4)
   #define ATL_DivByNB(N_) ((N_) >> 4)
   #define ATL_MulByNBNB(N_) ((N_) << 8)
   #define NBmm ATL_sJIK16x16x16TN16x16x0_a1_b1
   #define NBmm_b1 ATL_sJIK16x16x16TN16x16x0_a1_b1
   #define NBmm_b0 ATL_sJIK16x16x16TN16x16x0_a1_b0
   #define NBmm_bX ATL_sJIK16x16x16TN16x16x0_a1_bX

#endif
