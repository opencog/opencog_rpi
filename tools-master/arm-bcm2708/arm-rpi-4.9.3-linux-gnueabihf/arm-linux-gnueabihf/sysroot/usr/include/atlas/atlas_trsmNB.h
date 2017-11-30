#ifndef ATLAS_TRSMNB_H
   #define ATLAS_TRSMNB_H

   #ifdef SREAL
      #define TRSM_NB 48
   #elif defined(DREAL)
      #define TRSM_NB 36
   #elif defined(SCPLX)
      #define TRSM_NB 56
   #elif defined(DCPLX)
      #define TRSM_NB 56
   #endif

#endif
