#ifndef ATL_zGetNB_geqrf

/*
 * NB selection for GEQRF: Side='RIGHT', Uplo='UPPER'
 * M : 25,224,504,1008,1512,2016
 * N : 25,224,504,1008,1512,2016
 * NB : 5,12,12,12,56,56
 */
#define ATL_zGetNB_geqrf(n_, nb_) \
{ \
   if ((n_) < 124) (nb_) = 5; \
   else if ((n_) < 1260) (nb_) = 12; \
   else (nb_) = 56; \
}


#endif    /* end ifndef ATL_zGetNB_geqrf */
