#ifndef ATL_dGetNB_geqrf

/*
 * NB selection for GEQRF: Side='RIGHT', Uplo='UPPER'
 * M : 25,108,252,504,756,1008,2016
 * N : 25,108,252,504,756,1008,2016
 * NB : 4,12,12,12,36,36,36
 */
#define ATL_dGetNB_geqrf(n_, nb_) \
{ \
   if ((n_) < 66) (nb_) = 4; \
   else if ((n_) < 630) (nb_) = 12; \
   else (nb_) = 36; \
}


#endif    /* end ifndef ATL_dGetNB_geqrf */
