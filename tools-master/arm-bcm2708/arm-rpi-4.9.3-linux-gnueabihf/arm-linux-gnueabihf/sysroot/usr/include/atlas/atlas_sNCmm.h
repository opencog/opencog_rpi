#ifndef SMM_H
   #define SMM_H

   #define ATL_mmMULADD
   #define ATL_mmLAT 1
   #define ATL_mmMU  6
   #define ATL_mmNU  10
   #define ATL_mmKU  1
   #define MB 68
   #define NB 68
   #define KB 68
   #define NBNB 4624
   #define MBNB 4624
   #define MBKB 4624
   #define NBKB 4624
   #define NB2 136
   #define NBNB2 9248

   #define ATL_MulByNB(N_) ((N_) * 68)
   #define ATL_DivByNB(N_) ((N_) / 68)
   #define ATL_MulByNBNB(N_) ((N_) * 4624)

#endif
