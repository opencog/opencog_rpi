#ifndef ATL_dtGetNB_geqrf

/*
 * NB selection for GEQRF: Side='RIGHT', Uplo='UPPER'
 * M : 25,504,612,756,1008,2016,4032
 * N : 25,504,612,756,1008,2016,4032
 * NB : 4,4,36,36,36,36,72
 */
#define ATL_dtGetNB_geqrf(n_, nb_) \
{ \
   if ((n_) < 558) (nb_) = 4; \
   else if ((n_) < 3024) (nb_) = 36; \
   else (nb_) = 72; \
}


#endif    /* end ifndef ATL_dtGetNB_geqrf */
