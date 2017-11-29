#ifndef ATL_sGetNB_geqrf

/*
 * NB selection for GEQRF: Side='RIGHT', Uplo='UPPER'
 * M : 25,256,512,1008,2000
 * N : 25,256,512,1008,2000
 * NB : 4,16,16,16,16
 */
#define ATL_sGetNB_geqrf(n_, nb_) \
{ \
   if ((n_) < 140) (nb_) = 4; \
   else (nb_) = 16; \
}


#endif    /* end ifndef ATL_sGetNB_geqrf */
