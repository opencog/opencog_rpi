#ifndef ATL_stGetNB_geqrf

/*
 * NB selection for GEQRF: Side='RIGHT', Uplo='UPPER'
 * M : 25,1008,1504,2000,4000
 * N : 25,1008,1504,2000,4000
 * NB : 9,8,16,16,16
 */
#define ATL_stGetNB_geqrf(n_, nb_) \
{ \
   if ((n_) < 516) (nb_) = 9; \
   else if ((n_) < 1256) (nb_) = 8; \
   else (nb_) = 16; \
}


#endif    /* end ifndef ATL_stGetNB_geqrf */
