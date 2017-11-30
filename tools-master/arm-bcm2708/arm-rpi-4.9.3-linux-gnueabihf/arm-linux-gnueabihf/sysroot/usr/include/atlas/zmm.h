#ifndef ZMM_H
   #define ZMM_H

   #define ATL_mmMULADD
   #define ATL_mmLAT 1
   #define ATL_mmMU  4
   #define ATL_mmNU  3
   #define ATL_mmKU  2
   #define MB 36
   #define NB 36
   #define KB 36
   #define NBNB 1296
   #define MBNB 1296
   #define MBKB 1296
   #define NBKB 1296
   #define NB2 72
   #define NBNB2 2592

   #define ATL_MulByNB(N_) ((N_) * 36)
   #define ATL_DivByNB(N_) ((N_) / 36)
   #define ATL_MulByNBNB(N_) ((N_) * 1296)
void ATL_zJIK36x36x36TN36x36x0_a1_b0(const int M, const int N, const int K, const TYPE alpha, const TYPE *A, const int lda, const TYPE *B, const int ldb, const TYPE beta, TYPE *C, const int ldc);
void ATL_zJIK36x36x36TN36x36x0_a1_b1(const int M, const int N, const int K, const TYPE alpha, const TYPE *A, const int lda, const TYPE *B, const int ldb, const TYPE beta, TYPE *C, const int ldc);
void ATL_zJIK36x36x36TN36x36x0_a1_bX(const int M, const int N, const int K, const TYPE alpha, const TYPE *A, const int lda, const TYPE *B, const int ldb, const TYPE beta, TYPE *C, const int ldc);

   #define NBmm_b1(m_, n_, k_, al_, A_, lda_, B_, ldb_, be_, C_, ldc_) \
{ \
   ATL_zJIK36x36x36TN36x36x0_a1_bX(m_, n_, k_, al_, (A_), lda_, (B_), ldb_, ATL_rnone, C_, ldc_); \
   ATL_zJIK36x36x36TN36x36x0_a1_b1(m_, n_, k_, al_, (A_), lda_, (B_)+NBNB, ldb_, ATL_rone, (C_)+1, ldc_); \
   ATL_zJIK36x36x36TN36x36x0_a1_bX(m_, n_, k_, al_, (A_)+NBNB, lda_, (B_)+NBNB, ldb_, ATL_rnone, C_, ldc_); \
   ATL_zJIK36x36x36TN36x36x0_a1_b1(m_, n_, k_, al_, (A_)+NBNB, lda_, (B_), ldb_, ATL_rone, (C_)+1, ldc_); \
   }
   #define NBmm_b0(m_, n_, k_, al_, A_, lda_, B_, ldb_, be_, C_, ldc_) \
{ \
   ATL_zJIK36x36x36TN36x36x0_a1_b0(m_, n_, k_, al_, (A_), lda_, (B_), ldb_, ATL_rzero, C_, ldc_); \
   ATL_zJIK36x36x36TN36x36x0_a1_b0(m_, n_, k_, al_, (A_), lda_, (B_)+NBNB, ldb_, ATL_rzero, (C_)+1, ldc_); \
   ATL_zJIK36x36x36TN36x36x0_a1_bX(m_, n_, k_, al_, (A_)+NBNB, lda_, (B_)+NBNB, ldb_, ATL_rnone, C_, ldc_); \
   ATL_zJIK36x36x36TN36x36x0_a1_b1(m_, n_, k_, al_, (A_)+NBNB, lda_, (B_), ldb_, ATL_rone, (C_)+1, ldc_); \
   }
   #define NBmm_bX(m_, n_, k_, al_, A_, lda_, B_, ldb_, be_, C_, ldc_) \
{ \
   ATL_zJIK36x36x36TN36x36x0_a1_bX(m_, n_, k_, al_, (A_), lda_, (B_), ldb_, -(be_), C_, ldc_); \
   ATL_zJIK36x36x36TN36x36x0_a1_bX(m_, n_, k_, al_, (A_), lda_, (B_)+NBNB, ldb_, be_, (C_)+1, ldc_); \
   ATL_zJIK36x36x36TN36x36x0_a1_bX(m_, n_, k_, al_, (A_)+NBNB, lda_, (B_)+NBNB, ldb_, ATL_rnone, C_, ldc_); \
   ATL_zJIK36x36x36TN36x36x0_a1_b1(m_, n_, k_, al_, (A_)+NBNB, lda_, (B_), ldb_, ATL_rone, (C_)+1, ldc_); \
   }
   #define rNBmm_b1 ATL_dJIK36x36x36TN36x36x0_a1_b1
   #define rNBmm_b0 ATL_dJIK36x36x36TN36x36x0_a1_b0
   #define rNBmm_bX ATL_dJIK36x36x36TN36x36x0_a1_bX

#endif
