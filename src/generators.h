#ifndef _GENERATORS_H_
  #define _GENERATORS_H_
  #include <mkl_cblas.h>
  #include <mkl_lapacke.h>
  #include <mkl_vsl.h>
  //
  void col_major_matrix(double      *mm,
                        const int    nrow,
                        const int    ncol,
                        const int    seed,
                        const double lb,
                        const double rb);
  //
  void row_major_matrix(double      *mm,
                        const int    nrow,
                        const int    ncol,
                        const int    seed,
                        const double lb,
                        const double rb);
  //
#endif
