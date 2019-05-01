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
  const int iter = 1; 
  int       i;
  // matrix dimensions
  const int m = 20001; 
  const int n = 20001; 
	const int k = 5001;
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
  double *D;
  //
/*  A = (double *) malloc(sizeof(double)*m*k);
  B = (double *) malloc(sizeof(double)*k*n);
  C = (double *) malloc(sizeof(double)*m*n);
  D = (double *) malloc(sizeof(double)*m*n); // */
  // MCDRAM version
  A = (double *) hbw_malloc(sizeof(double)*m*k);
  hbw_posix_memalign((void *) A, 64, sizeof(double)*m*k);
  B = (double *) hbw_malloc(sizeof(double)*k*n);
  hbw_posix_memalign((void *) B, 64, sizeof(double)*k*n);
  C = (double *) hbw_malloc(sizeof(double)*m*n);
  hbw_posix_memalign((void *) C, 64, sizeof(double)*m*n);
  D = (double *) hbw_malloc(sizeof(double)*m*n);
  hbw_posix_memalign((void *) D, 64, sizeof(double)*m*n); // */
  // generate matrices
  row_major_matrix(&A[0], m, k, 777,  -1.0,  1.0);
  row_major_matrix(&B[0], k, n, 888, -10.0, 10.0);
  row_major_matrix(&C[0], m, n, 999, -20.0, 20.0);
  /*for(i=0; i<m*k; ++i)
  {
    printf("A[%d]=%f\n",i,A[i]);
  }
  int mq = (m+3-1) / 3;
  int md = m % 3;
  double _A[mq*3*9] __attribute__((aligned(64)));
  packarc(m,k,&A[0],k,_A);
  for(i=0; i<mq*3*9; ++i)
  {
    printf("A[%d]=%f\n",i,_A[i]);
  }*/
  //col_major_matrix(&A[0], m, k, 777,  -1.0,  1.0);
  //col_major_matrix(&B[0], k, n, 888, -10.0, 10.0);
  //col_major_matrix(&C[0], m, n, 999, -20.0, 20.0);
  D[0:m*n] = C[0:m*n]; 
  // buffertoflush
/*  static const double *bufToFlushLlc = NULL;
double *arr;
arr = (double *) malloc(sizeof(double)*7);

register __mmask8 _mask1;
register __m512d _tmp1, _tmp2;
_tmp1 = _mm512_setzero_pd();
_tmp2 = _mm512_setzero_pd();
_mask1 = _mm512_kmov (127);
for (i=0; i<7; ++i)
{
	arr[i] = i*1.0;
}
//A[7] = 11.1;
//_tmp1 = _mm512_mask_loadu_pd(_tmp2, _mask1, &A[0]);
_tmp1 = _mm512_loadu_pd(&A[0]);
//_mm512_store_pd(&A[0], _tmp1);
_mm512_mask_store_pd(&arr[0],_mask1,_tmp1);
for (i=0;i<8;++i)
{
	printf("%f\t", arr[i]);
} // */

  // test
  for(i = 0; i < iter; ++i)
  {
//  bufToFlushLlc = (double *)_mm_malloc(34*1024*1024, 64);
    startTime = omp_get_wtime();

    // dgemm
    //user_dgemm(m ,n, k, A, B, C);
    user_dgemm(m ,n, k, A, k, B, n, C, n);
	//p1d_dgemm(m,n,k,A,k,B,n,C,n);
    // mkl
    //cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
    //  m, n, k, 1.0, A, k, B, n, 1.0, C, n);

    endTime = omp_get_wtime();

    // flops
    gap = (double)( endTime - startTime );
    flops = (2.0 * (double)m * (double)n * (double)k) * 1.0e-9 / gap;
    printf("dgemm time (sec)\t%f, Gflops\t%f \n", gap, flops);
  }
  {
    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
      m, n, k, 1.0, A, k, B, n, 1.0, D, n);
    cblas_daxpy(m*n, -1.0, C, 1, D, 1);
    norm = cblas_dnrm2(m*n, D, 1);
    printf("|| C-C_mkl || = %e\n",norm);
  } // */
//  free(A);
//  free(B);
//  free(C);
//  free(D);
  // MCDRAM version
  hbw_free(A);
  hbw_free(B);
  hbw_free(C);
  hbw_free(D);
}
