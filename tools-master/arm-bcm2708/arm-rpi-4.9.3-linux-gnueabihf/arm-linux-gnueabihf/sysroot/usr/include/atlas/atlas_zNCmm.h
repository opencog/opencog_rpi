#ifndef ZMM_H
   #define ZMM_H

   #define ATL_mmMULADD
   #define ATL_mmLAT 1
   #define ATL_mmMU  4
   #define ATL_mmNU  12
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

#endif
