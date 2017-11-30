#ifndef ATL_cGetNB_geqrf

/*
 * NB selection for GEQRF: Side='RIGHT', Uplo='UPPER'
 * M : 25,112,224,504,1008,1512,1736,2016
 * N : 25,112,224,504,1008,1512,1736,2016
 * NB : 4,4,8,8,8,24,56,56
 */
#define ATL_cGetNB_geqrf(n_, nb_) \
{ \
   if ((n_) < 168) (nb_) = 4; \
   else if ((n_) < 1260) (nb_) = 8; \
   else if ((n_) < 1624) (nb_) = 24; \
   else (nb_) = 56; \
}


#endif    /* end ifndef ATL_cGetNB_geqrf */
