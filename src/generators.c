#include "generators.h"

// col-major store
void col_major_matrix(double      *mm,
                      const int    nrow,
                      const int    ncol,
                      const int    seed,
                      const double lb,
                      const double rb)
{
  int i;
  VSLStreamStatePtr stm;
  //
  vslNewStream(&stm, VSL_BRNG_MT19937, seed);
  #pragma ivdep
  for(i = 0; i < ncol; ++i)
  {
    vdRngUniform(VSL_RNG_METHOD_UNIFORM_STD_ACCURATE,stm,nrow,&mm[i*nrow],lb,rb);
  }
  vslDeleteStream(&stm);
}

// column-major store
void row_major_matrix(double      *mm,
                      const int    nrow,
                      const int    ncol,
                      const int    seed,
                      const double lb,
                      const double rb)
{
  int i;
  VSLStreamStatePtr stm;
  //
  vslNewStream(&stm, VSL_BRNG_MT19937, seed);
  #pragma ivdep
  for(i = 0; i < nrow; ++i)
  {
    vdRngUniform(VSL_RNG_METHOD_UNIFORM_STD_ACCURATE,stm,ncol,&mm[i*ncol],lb,rb);
  }
  vslDeleteStream(&stm);
}
