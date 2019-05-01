#include "avx512.h"
#include <sys/mman.h>
// notation
// m = n*q + d
// quotient : Xq
// remainder: Xd

// Packing A, r-major -> c-major
void packarc(int           row, // # of rows
             int           col, // # of cols
             const double *mt,
             int           inc, // distance
             double       *bk)
{
  int q = row / MR;
  int r = row % MR;
  int i;
  int j;
  for(i = 0; i < q; ++i)
  {
    for(j = 0; j < col; ++j)
    {
      bk[0:MR] = mt[0:MR:inc];
      bk += MR;
    //  bk += MR;
      mt += 1;
    }
    mt += (inc*MR-col);
  }
  if(r > 0)
  {
    for(j = 0; j < col; ++j)
    {
      bk[0:r] = mt[0:r:inc];
      bk[r:MR-r] = 0.0;
      bk += MR;
//      bk += MR;
      mt += 1;
    }
  }
}

void packarc_ver1(int           row, // # of rows
             int           col, // # of cols
             const double *mt,
             int           inc, // distance
             double       *bk)
{
  int q = row / MR;
  int r = row % MR;
  int i;
  int j;
  register __m512d _tmp1, _tmp2, _tmp3, _tmp4; // Vector register for LOAD & STORE
  register __mmask8 _mask1;

  _mask1 = _mm512_kmov (127);
  for(i = 0; i < q; ++i)
  {
    for(j = 0; j < col; ++j)
    {
      _tmp1 = _mm512_set_pd(mt[inc*7], mt[inc*6], mt[inc*5], mt[inc*4], mt[inc*3], mt[inc*2], mt[inc*1], mt[0]);
      _tmp2 = _mm512_set_pd(mt[inc*15], mt[inc*14], mt[inc*13], mt[inc*12], mt[inc*11], mt[inc*10], mt[inc*9], mt[inc*8]);
      _tmp3 = _mm512_set_pd(mt[inc*23], mt[inc*22], mt[inc*21], mt[inc*20], mt[inc*19], mt[inc*18], mt[inc*17], mt[inc*16]);
  //    _tmp4 = _mm512_set_pd(0.0, mt[inc*30], mt[inc*29], mt[inc*28], mt[inc*27], mt[inc*26], mt[inc*25], mt[inc*24]);
      _mm512_store_pd(&bk[0],_tmp1); 
      _mm512_store_pd(&bk[8],_tmp2); 
      _mm512_store_pd(&bk[16],_tmp3); 
//      _mm512_store_pd(&bk[24],_tmp4); 
      //_mm512_mask_store_pd(&bk[24],_mask1,_tmp4); 
      //bk[0:MR] = mt[0:MR:inc];
			bk[24:7] = mt[inc*24:7:inc];
//      bk += MR+1;
      bk += MR;
      mt += 1;
    }
    mt += (inc*MR-col);
  }
  if(r > 0)
  {
    for(j = 0; j < col; ++j)
    {
      bk[0:r] = mt[0:r:inc];
      bk[r:MR-r] = 0.0;
//      bk += MR+1;
      bk += MR;
      mt += 1;
    }
  }
}

// Packing B, r-major -> r-major
void packbrr(int           row, // # of rows
             int           col, // # of cols
             const double *mt,
             int           inc, // distance
             double       *bk)
{
  int q = col / NR;
  int r = col % NR;
  int i;
  int j;
  register __m512d temp;
  omp_set_nested(1);

  #pragma omp parallel for num_threads(NT) private(i) //schedule(dynamic)
  for(j = 0; j < q; ++j)
  {
//  #pragma omp parallel for num_threads(16)// private()
    for(i = 0; i < row; ++i)
    {
/*      bk[0:NR] = mt[0:NR];
      bk += NR;
      mt += inc;*/
      bk[i*NR+j*row*NR:NR] = mt[i*inc+j*NR:NR];
//    _mm_prefetch((const void*) &mt[P_PRE],_MM_HINT_T0); // L1
//	  temp = _mm512_loadu_pd(&mt[i*inc+j*NR]);
//	  _mm512_store_pd(&bk[i*NR+j*row*NR],temp);
    }
//    mt += (NR - row*inc);
  }
  bk += q*row*NR;
  mt += q*NR;
  if(r > 0)
  {
    for(i = 0; i < row; ++i)
    {
      bk[0:r] = mt[0:r];
      bk[r:NR-r] = 0.0;
      bk += NR;
      mt += inc;
    }
  }
}

// micro kernel0, 31x8
void micro_kernel0(int                    k,
                   const double * A,
                   const double * B,
                   double       * C,
                   int                    ncol)
{
  int i;
//  int L1_DIST_C=1*MR*ncol;
  // intrinsics
  register __m512d __B;
  register __m512d _C0, _C1, _C2, _C3, _C4, _C5, _C6, _C7;
  register __m512d _C8, _C9, _CA, _CB, _CC, _CD, _CE, _CF;
  register __m512d _C10, _C11, _C12, _C13, _C14, _C15, _C16, _C17;
  register __m512d _C18, _C19, _C1A, _C1B, _C1C, _C1D, _C1E;
  // initialization, _CX <- C
  
  _C0 = _mm512_loadu_pd(&C[0]);
  _C1 = _mm512_loadu_pd(&C[ncol]);
  _C2 = _mm512_loadu_pd(&C[2*ncol]);
  _C3 = _mm512_loadu_pd(&C[3*ncol]);
  _C4 = _mm512_loadu_pd(&C[4*ncol]);
  _C5 = _mm512_loadu_pd(&C[5*ncol]);
  _C6 = _mm512_loadu_pd(&C[6*ncol]);
  _C7 = _mm512_loadu_pd(&C[7*ncol]);
  _C8 = _mm512_loadu_pd(&C[8*ncol]);
  _C9 = _mm512_loadu_pd(&C[9*ncol]);
  _CA = _mm512_loadu_pd(&C[10*ncol]);
  _CB = _mm512_loadu_pd(&C[11*ncol]);
  _CC = _mm512_loadu_pd(&C[12*ncol]);
  _CD = _mm512_loadu_pd(&C[13*ncol]);
  _CE = _mm512_loadu_pd(&C[14*ncol]);
  _CF = _mm512_loadu_pd(&C[15*ncol]);
  _C10 = _mm512_loadu_pd(&C[16*ncol]);
  _C11 = _mm512_loadu_pd(&C[17*ncol]);
  _C12 = _mm512_loadu_pd(&C[18*ncol]);
  _C13 = _mm512_loadu_pd(&C[19*ncol]);
  _C14 = _mm512_loadu_pd(&C[20*ncol]);
  _C15 = _mm512_loadu_pd(&C[21*ncol]);
  _C16 = _mm512_loadu_pd(&C[22*ncol]);
  _C17 = _mm512_loadu_pd(&C[23*ncol]);
  _C18 = _mm512_loadu_pd(&C[24*ncol]);
  _C19 = _mm512_loadu_pd(&C[25*ncol]);
  _C1A = _mm512_loadu_pd(&C[26*ncol]);
  _C1B = _mm512_loadu_pd(&C[27*ncol]);
  _C1C = _mm512_loadu_pd(&C[28*ncol]);
  _C1D = _mm512_loadu_pd(&C[29*ncol]);
  _C1E = _mm512_loadu_pd(&C[30*ncol]);
  // _C += A*B
  #pragma unroll (NU)
  for(i = 0; i < k; ++i)
  {
    _mm_prefetch((const void*) &B[L1_DIST_B],_MM_HINT_T0); // L1
    _mm_prefetch((const void*) &A[L1_DIST_A],_MM_HINT_T0); // L1
    _mm_prefetch((const void*) &A[L1_DIST_A+8],_MM_HINT_T0); // L1
    _mm_prefetch((const void*) &A[L1_DIST_A+16],_MM_HINT_T0); // L1
    _mm_prefetch((const void*) &A[L1_DIST_A+24],_MM_HINT_T0); // L1
    __B = _mm512_load_pd(&B[0]);
    _C0 = _mm512_fmadd_pd(_mm512_set1_pd(A[0]),__B,_C0);
    _C1 = _mm512_fmadd_pd(_mm512_set1_pd(A[1]),__B,_C1);
    _C2 = _mm512_fmadd_pd(_mm512_set1_pd(A[2]),__B,_C2);
    _C3 = _mm512_fmadd_pd(_mm512_set1_pd(A[3]),__B,_C3);
    _C4 = _mm512_fmadd_pd(_mm512_set1_pd(A[4]),__B,_C4);
    _C5 = _mm512_fmadd_pd(_mm512_set1_pd(A[5]),__B,_C5);
    _C6 = _mm512_fmadd_pd(_mm512_set1_pd(A[6]),__B,_C6);
    _C7 = _mm512_fmadd_pd(_mm512_set1_pd(A[7]),__B,_C7);
    _C8 = _mm512_fmadd_pd(_mm512_set1_pd(A[8]),__B,_C8);
    _C9 = _mm512_fmadd_pd(_mm512_set1_pd(A[9]),__B,_C9);
    _CA = _mm512_fmadd_pd(_mm512_set1_pd(A[10]),__B,_CA);
    _CB = _mm512_fmadd_pd(_mm512_set1_pd(A[11]),__B,_CB);
    _CC = _mm512_fmadd_pd(_mm512_set1_pd(A[12]),__B,_CC);
    _CD = _mm512_fmadd_pd(_mm512_set1_pd(A[13]),__B,_CD);
    _CE = _mm512_fmadd_pd(_mm512_set1_pd(A[14]),__B,_CE);
    _CF = _mm512_fmadd_pd(_mm512_set1_pd(A[15]),__B,_CF);
    _C10 = _mm512_fmadd_pd(_mm512_set1_pd(A[16]),__B,_C10);
    _C11 = _mm512_fmadd_pd(_mm512_set1_pd(A[17]),__B,_C11);
    _C12 = _mm512_fmadd_pd(_mm512_set1_pd(A[18]),__B,_C12);
    _C13 = _mm512_fmadd_pd(_mm512_set1_pd(A[19]),__B,_C13);
    _C14 = _mm512_fmadd_pd(_mm512_set1_pd(A[20]),__B,_C14);
    _C15 = _mm512_fmadd_pd(_mm512_set1_pd(A[21]),__B,_C15);
    _C16 = _mm512_fmadd_pd(_mm512_set1_pd(A[22]),__B,_C16);
    _C17 = _mm512_fmadd_pd(_mm512_set1_pd(A[23]),__B,_C17);
    _C18 = _mm512_fmadd_pd(_mm512_set1_pd(A[24]),__B,_C18);
    _C19 = _mm512_fmadd_pd(_mm512_set1_pd(A[25]),__B,_C19);
    _C1A = _mm512_fmadd_pd(_mm512_set1_pd(A[26]),__B,_C1A);
    _C1B = _mm512_fmadd_pd(_mm512_set1_pd(A[27]),__B,_C1B);
    _C1C = _mm512_fmadd_pd(_mm512_set1_pd(A[28]),__B,_C1C);
    _C1D = _mm512_fmadd_pd(_mm512_set1_pd(A[29]),__B,_C1D);
    _C1E = _mm512_fmadd_pd(_mm512_set1_pd(A[30]),__B,_C1E);
//  A += MR+1;
    A += MR;
    B += NR;
  }
  // store _C -> C
  _mm512_storeu_pd(&C[0],_C0);
  _mm512_storeu_pd(&C[ncol],_C1);
  _mm512_storeu_pd(&C[2*ncol],_C2);
  _mm512_storeu_pd(&C[3*ncol],_C3);
  _mm512_storeu_pd(&C[4*ncol],_C4);
  _mm512_storeu_pd(&C[5*ncol],_C5);
  _mm512_storeu_pd(&C[6*ncol],_C6);
  _mm512_storeu_pd(&C[7*ncol],_C7);
  _mm512_storeu_pd(&C[8*ncol],_C8);
  _mm512_storeu_pd(&C[9*ncol],_C9);
  _mm512_storeu_pd(&C[10*ncol],_CA);
  _mm512_storeu_pd(&C[11*ncol],_CB);
  _mm512_storeu_pd(&C[12*ncol],_CC);
  _mm512_storeu_pd(&C[13*ncol],_CD);
  _mm512_storeu_pd(&C[14*ncol],_CE);
  _mm512_storeu_pd(&C[15*ncol],_CF);
  _mm512_storeu_pd(&C[16*ncol],_C10);
  _mm512_storeu_pd(&C[17*ncol],_C11);
  _mm512_storeu_pd(&C[18*ncol],_C12);
  _mm512_storeu_pd(&C[19*ncol],_C13);
  _mm512_storeu_pd(&C[20*ncol],_C14);
  _mm512_storeu_pd(&C[21*ncol],_C15);
  _mm512_storeu_pd(&C[22*ncol],_C16);
  _mm512_storeu_pd(&C[23*ncol],_C17);
  _mm512_storeu_pd(&C[24*ncol],_C18);
  _mm512_storeu_pd(&C[25*ncol],_C19);
  _mm512_storeu_pd(&C[26*ncol],_C1A);
  _mm512_storeu_pd(&C[27*ncol],_C1B);
  _mm512_storeu_pd(&C[28*ncol],_C1C);
  _mm512_storeu_pd(&C[29*ncol],_C1D);
  _mm512_storeu_pd(&C[30*ncol],_C1E);
}

// micro kernel1, 31x8
void micro_kernel1(int                    k,
                   const double * A,
                   const double * B,
                   double       * C,
                   int                    ncol)
{
  int i;
  // intrinsics
  register __m512d __B;
  register __m512d _C0, _C1, _C2, _C3, _C4, _C5, _C6, _C7;
  register __m512d _C8, _C9, _CA, _CB, _CC, _CD, _CE, _CF;
  register __m512d _C10, _C11, _C12, _C13, _C14, _C15, _C16, _C17;
  register __m512d _C18, _C19, _C1A, _C1B, _C1C, _C1D, _C1E;
  // initialization, _C = 0
  _C0 = _mm512_setzero_pd(); _C1 = _mm512_setzero_pd();
  _C2 = _mm512_setzero_pd(); _C3 = _mm512_setzero_pd();
  _C4 = _mm512_setzero_pd(); _C5 = _mm512_setzero_pd();
  _C6 = _mm512_setzero_pd(); _C7 = _mm512_setzero_pd();
  _C8 = _mm512_setzero_pd(); _C9 = _mm512_setzero_pd();
  _CA = _mm512_setzero_pd(); _CB = _mm512_setzero_pd();
  _CC = _mm512_setzero_pd(); _CD = _mm512_setzero_pd();
  _CE = _mm512_setzero_pd(); _CF = _mm512_setzero_pd();
  _C10 = _mm512_setzero_pd(); _C11 = _mm512_setzero_pd();
  _C12 = _mm512_setzero_pd(); _C13 = _mm512_setzero_pd();
  _C14 = _mm512_setzero_pd(); _C15 = _mm512_setzero_pd();
  _C16 = _mm512_setzero_pd(); _C17 = _mm512_setzero_pd();
  _C18 = _mm512_setzero_pd(); _C19 = _mm512_setzero_pd();
  _C1A = _mm512_setzero_pd(); _C1B = _mm512_setzero_pd();
  _C1C = _mm512_setzero_pd(); _C1D = _mm512_setzero_pd();
  _C1E = _mm512_setzero_pd();
  // _C += A*B
  #pragma unroll (NU)
  for(i = 0; i < k; ++i)
  {
    _mm_prefetch((const void*) &B[L1_DIST_B],_MM_HINT_T0); // L1
    _mm_prefetch((const void*) &A[L1_DIST_A],_MM_HINT_T0); // L1
    _mm_prefetch((const void*) &A[L1_DIST_A+8],_MM_HINT_T0); // L1
    _mm_prefetch((const void*) &A[L1_DIST_A+16],_MM_HINT_T0); // L1
    _mm_prefetch((const void*) &A[L1_DIST_A+24],_MM_HINT_T0); // L1
    __B = _mm512_load_pd(&B[0]);
    _C0 = _mm512_fmadd_pd(_mm512_set1_pd(A[0]),__B,_C0);
    _C1 = _mm512_fmadd_pd(_mm512_set1_pd(A[1]),__B,_C1);
    _C2 = _mm512_fmadd_pd(_mm512_set1_pd(A[2]),__B,_C2);
    _C3 = _mm512_fmadd_pd(_mm512_set1_pd(A[3]),__B,_C3);
    _C4 = _mm512_fmadd_pd(_mm512_set1_pd(A[4]),__B,_C4);
    _C5 = _mm512_fmadd_pd(_mm512_set1_pd(A[5]),__B,_C5);
    _C6 = _mm512_fmadd_pd(_mm512_set1_pd(A[6]),__B,_C6);
    _C7 = _mm512_fmadd_pd(_mm512_set1_pd(A[7]),__B,_C7);
    _C8 = _mm512_fmadd_pd(_mm512_set1_pd(A[8]),__B,_C8);
    _C9 = _mm512_fmadd_pd(_mm512_set1_pd(A[9]),__B,_C9);
    _CA = _mm512_fmadd_pd(_mm512_set1_pd(A[10]),__B,_CA);
    _CB = _mm512_fmadd_pd(_mm512_set1_pd(A[11]),__B,_CB);
    _CC = _mm512_fmadd_pd(_mm512_set1_pd(A[12]),__B,_CC);
    _CD = _mm512_fmadd_pd(_mm512_set1_pd(A[13]),__B,_CD);
    _CE = _mm512_fmadd_pd(_mm512_set1_pd(A[14]),__B,_CE);
    _CF = _mm512_fmadd_pd(_mm512_set1_pd(A[15]),__B,_CF);
    _C10 = _mm512_fmadd_pd(_mm512_set1_pd(A[16]),__B,_C10);
    _C11 = _mm512_fmadd_pd(_mm512_set1_pd(A[17]),__B,_C11);
    _C12 = _mm512_fmadd_pd(_mm512_set1_pd(A[18]),__B,_C12);
    _C13 = _mm512_fmadd_pd(_mm512_set1_pd(A[19]),__B,_C13);
    _C14 = _mm512_fmadd_pd(_mm512_set1_pd(A[20]),__B,_C14);
    _C15 = _mm512_fmadd_pd(_mm512_set1_pd(A[21]),__B,_C15);
    _C16 = _mm512_fmadd_pd(_mm512_set1_pd(A[22]),__B,_C16);
    _C17 = _mm512_fmadd_pd(_mm512_set1_pd(A[23]),__B,_C17);
    _C18 = _mm512_fmadd_pd(_mm512_set1_pd(A[24]),__B,_C18);
    _C19 = _mm512_fmadd_pd(_mm512_set1_pd(A[25]),__B,_C19);
    _C1A = _mm512_fmadd_pd(_mm512_set1_pd(A[26]),__B,_C1A);
    _C1B = _mm512_fmadd_pd(_mm512_set1_pd(A[27]),__B,_C1B);
    _C1C = _mm512_fmadd_pd(_mm512_set1_pd(A[28]),__B,_C1C);
    _C1D = _mm512_fmadd_pd(_mm512_set1_pd(A[29]),__B,_C1D);
    _C1E = _mm512_fmadd_pd(_mm512_set1_pd(A[30]),__B,_C1E);
    A += MR;
//    A += MR+1;
    B += NR;
  }
  // store _C -> C
  _mm512_store_pd(&C[0],_C0);
  _mm512_store_pd(&C[ncol],_C1);
  _mm512_store_pd(&C[2*ncol],_C2);
  _mm512_store_pd(&C[3*ncol],_C3);
  _mm512_store_pd(&C[4*ncol],_C4);
  _mm512_store_pd(&C[5*ncol],_C5);
  _mm512_store_pd(&C[6*ncol],_C6);
  _mm512_store_pd(&C[7*ncol],_C7);
  _mm512_store_pd(&C[8*ncol],_C8);
  _mm512_store_pd(&C[9*ncol],_C9);
  _mm512_store_pd(&C[10*ncol],_CA);
  _mm512_store_pd(&C[11*ncol],_CB);
  _mm512_store_pd(&C[12*ncol],_CC);
  _mm512_store_pd(&C[13*ncol],_CD);
  _mm512_store_pd(&C[14*ncol],_CE);
  _mm512_store_pd(&C[15*ncol],_CF);
  _mm512_store_pd(&C[16*ncol],_C10);
  _mm512_store_pd(&C[17*ncol],_C11);
  _mm512_store_pd(&C[18*ncol],_C12);
  _mm512_store_pd(&C[19*ncol],_C13);
  _mm512_store_pd(&C[20*ncol],_C14);
  _mm512_store_pd(&C[21*ncol],_C15);
  _mm512_store_pd(&C[22*ncol],_C16);
  _mm512_store_pd(&C[23*ncol],_C17);
  _mm512_store_pd(&C[24*ncol],_C18);
  _mm512_store_pd(&C[25*ncol],_C19);
  _mm512_store_pd(&C[26*ncol],_C1A);
  _mm512_store_pd(&C[27*ncol],_C1B);
  _mm512_store_pd(&C[28*ncol],_C1C);
  _mm512_store_pd(&C[29*ncol],_C1D);
  _mm512_store_pd(&C[30*ncol],_C1E);
}

// Micro C = _C + C
void micro_dxpy(int                    m,
                int                    n,
                double       * C,
                const double * D,
                int                    ncol)
{
  int i;
  for(i = 0; i < m; ++i)
  {
    C[0:n] += D[i*NR:n];
    C += ncol;
  }
}
//
void ijrloop(const int              m,
             const int              n,
             const int              ni,
             const int              k,
             const int              ki,
             const double * A,
             const int              la,
             const double * B,
             double       * C,
             const int              lc)
{
  int mq = (m+MB-1) / MB;
  int md = m % MB;
  int mc;
  int nq = (n+NR-1) / NR;
  int nd = n % NR;
  int nc;
  int pq;
  int pd;
  int pc;
  int i;
  int j;
  int p;
  int kt = MB/MR;
	int thd_id, chunk;
  //
//  double *_A;
//  double _A[(MB+kt)*KB] __attribute__((aligned(64)));
  double _A[(MB)*KB] __attribute__((aligned(64)));
/*   _A = (double *) hbw_malloc(sizeof(double)*KB*(MB+kt));
   hbw_posix_memalign((void *) _A, 64, sizeof(double)*KB*(MB+kt));*/
/*  double *_A = (double *)mmap(0,sizeof(double)*(MB+kt)*KB, PROT_READ|PROT_WRITE,
  MAP_ANONYMOUS|MAP_PRIVATE|MAP_HUGETLB,-1,0);*/
  double _C[MR*NR] __attribute__((aligned(64)));
  //
  {
  	omp_set_nested(1);
	//omp_set_dynamic(1);
  #pragma omp parallel num_threads(NT1) private(_A, mc, i)
{
    #pragma omp for schedule(dynamic)
    for(i = 0; i < mq; ++i)
    {
      mc = (i != mq-1 || md == 0) ? MB : md;
      packarc(mc,k,&A[ki*KB+i*MB*la],la,_A);
//      packarc_ver1(mc,k,&A[ki*KB+i*MB*la],la,_A);
       thd_id=omp_get_thread_num();
			 chunk=n/NT1*thd_id;
       chunk=nq-BUFFER;
//chunk=0;
//			printf("%d\n", chunk);
	#pragma omp parallel num_threads(NT2) private(j,nc,pq,p,pd,pc,_C,chunk) shared(_A, i,mc)
       {
       #pragma omp for //schedule(dynamic)  	
        for(j = chunk; j <nq+chunk ; ++j)
        {
		j = j%nq;
          nc = (j != nq-1 || nd == 0) ? NR : nd;
          pq = (mc+MR-1) / MR;
          pd = mc % MR;
          for(p = 0; p < pq; ++p)
          {
            pc = (p != pq-1 || pd == 0) ? MR : pd;
            if(pc == MR && nc == NR)
           {
			 //  micro_kernel0(k,&_A[p*(MR+1)*k],&B[j*NR*k],&C[i*MB*lc+p*MR*lc+ni*NB+j*NR],lc);
			  micro_kernel0(k,&_A[p*(MR)*k],&B[j*NR*k],&C[i*MB*lc+p*MR*lc+ni*NB+j*NR],lc);
            }
            else
            {
//              micro_kernel1(k,&_A[p*(MR+1)*k],&B[j*NR*k],_C,NR);
              micro_kernel1(k,&_A[p*(MR)*k],&B[j*NR*k],_C,NR);
              micro_dxpy(pc,nc,&C[i*MB*lc+p*MR*lc+ni*NB+j*NR],_C,lc);
            }
          }
        
	}
	#pragma omp barrier
      }
      }
	  #pragma omp barrier
    }
 }
}

//
void user_dgemm(const int              m,
                const int              n,
                const int              k,
                const double * A,
                const int              la, // distance
                const double * B,
                const int              lb, // distance
                double       * C,
                const int              lc)
{
  int nq = (n+NB-1) / NB;
  int nd = n % NB;
  int nc;
  int kq = (k+KB-1) / KB;
  int kd = k % KB;
  int kc;
  int j;
  int l;
//    static double _B[KB*NB] __attribute__((aligned(64)));
  // j-loop
  double *_B;
  omp_set_nested(1);
  _B = (double *) hbw_malloc(sizeof(double)*KB*NB);
  hbw_posix_memalign((void *) _B, 64, sizeof(double)*KB*NB); // */
/*  _B = (double *)mmap(0,sizeof(double)*KB*NB, PROT_READ|PROT_WRITE,
  MAP_ANONYMOUS|MAP_PRIVATE|MAP_HUGETLB,-1,0); // */
//  hbw_posix_memalign((void *) _B, 64, sizeof(double)*KB*NB);
//  omp_set_dynamic(0);
  for(j = 0; j < nq; ++j)
  {
    nc = (j != nq-1 || nd == 0) ? NB : nd;
    for(l = 0; l < kq; ++l)
    {
      kc = (l != kq-1 || kd == 0) ? KB : kd;
      packbrr(kc,nc,&B[j*NB+l*KB*lb],lb,_B);
      //i-jr loop
      ijrloop(m,nc,j,kc,l,A,la,_B,C,lc);
    }
  }
}
