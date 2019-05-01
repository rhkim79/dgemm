#include "commons.h"
#include "generators.h"
#include "avx512.h"
//
// General Matrix-Matrix Multiplication (GEMM)
// Test routine

int main(int    argc,
         char **argv)
{
  // test type
  const int iter = 3;
  int       i;
  // matrix dimensions
#ifndef MSIZE
#define MSIZE 20000
#endif
#ifndef NSIZE
#define NSIZE 20000
#endif


  const int m = MSIZE;
  const int n = NSIZE; 
 	const int k = MSIZE;
// const int k = (2400/KB)*KB;
// const int k = 12*KB;
  // iteration, time, validity
  double startTime;
  double endTime;
  double gap;
  double flops;
  double norm;
  // matrices
  double *A;
  double *B;
  double *C;
  //
/*  A = (double *) malloc(sizeof(double)*m*k);
  B = (double *) malloc(sizeof(double)*k*n);
  C = (double *) malloc(sizeof(double)*m*n);//  */
  // MCDRAM version
  A = (double *) hbw_malloc(sizeof(double)*m*k);
  hbw_posix_memalign((void *) A, 64, sizeof(double)*m*k);
  B = (double *) hbw_malloc(sizeof(double)*k*n);
  hbw_posix_memalign((void *) B, 64, sizeof(double)*k*n);
  C = (double *) hbw_malloc(sizeof(double)*m*n);
  hbw_posix_memalign((void *) C, 64, sizeof(double)*m*n);  // */
  // generate matrices
  row_major_matrix(&A[0], m, k, 777,  -1.0,  1.0);
  row_major_matrix(&B[0], k, n, 888, -10.0, 10.0);
  row_major_matrix(&C[0], m, n, 999, -20.0, 20.0);
  //col_major_matrix(&A[0], m, k, 777,  -1.0,  1.0);
  //col_major_matrix(&B[0], k, n, 888, -10.0, 10.0);
  //col_major_matrix(&C[0], m, n, 999, -20.0, 20.0);
//  printf("m=%d n=%d k=%d\n mb=%d kb=%d\n",m,n,k,MB,KB);
	printf("L1_DIST_A\t %d, L1_DIST_B\t %d, kb\t %d\n", L1_DIST_A, L1_DIST_B, KB);
  // test
////  double * bufToFlushLlc;
  static const double *bufToFlushLlc = NULL;
  for(i = 0; i < iter; ++i)
  {
//    bufToFlushLlc = (double *)calloc(34*1024*1024, 64);
    startTime = omp_get_wtime();
    // dgemm
    user_dgemm(m ,n, k, A, k, B, n, C, n);
  /* cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
     m, n, k, 1.0, A, k, B, n, 1.0, C, n); // */
  //    
   // p1d_dgemm(m ,n, k, A, k, B, n, C, n);
    endTime = omp_get_wtime();
    // flops
    gap = (double)( endTime - startTime );
    flops = (2.0 * (double)m * (double)n * (double)k) * 1.0e-9 / gap;
    printf("dgemm time (sec)\t%f, Gflops\t%f \n", gap, flops);
  //  printf("%f\n",flops);
  }
  //printf("done\n");
/*  free(A);
  free(B);
  free(C); // */
  // MCDRAM version
  hbw_free(A);
  hbw_free(B);
  hbw_free(C);  // */
//  free(bufToFlushLlc);
  }
