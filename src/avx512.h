#ifndef _AVX512_H_
  #define _AVX512_H_
  // Libraries
  #include "commons.h"
  #include <x86intrin.h>
  #include <immintrin.h>
  #include <zmmintrin.h>
  // Local parameters
/*  #define MR 28
  #define NR 8
  #define KB 240 // 240
  #define MB 112 */ 
  #define MR 31
  #define NR 8
#ifndef KB
  #define KB 438 // 240
#endif
  #define MB 124  
  // (4800,4800) (5600,6000) (6000,6400)
  // (6400,6400) (6800,6880) (7200,7280) (8000,8096) (8800,8960), (9600,9632)
//  #define NB 6400
#ifndef NB 
  #define NB 20000 
#endif
  // prefetch
  #define PREFX_L1 20
#ifndef L1_DIST_A
  #define L1_DIST_A PREFX_L1*MR //300 // 31 62 93 124 155 186 217 248 279 310
#endif
#ifndef L1_DIST_B
  #define L1_DIST_B PREFX_L1*NR //320 // 320 // 8 16 24 32 40 48 56 64 72 80*/
#endif
/*	#define L1_DIST_A 24*(MR+1)//576 //300 // 31 62 93 124 155 186 217 248 279 310
//  #define L1_DIST_A 558 //300 // 31 62 93 124 155 186 217 248 279 310
	#define L1_DIST_B 24*NR//192 // or 176 */

//  #define L1_DIST_C 16//320 // 320 // 8 16 24 32 40 48 56 64 72 80
//  #define L1_DIST_A 308 //300 // 31 62 93 124 155 186 217 248 279 310
//  #define L1_DIST_B 224 //320 // 320 // 8 16 24 32 40 48 56 64 72 80
  // unroll
#ifndef NU
#define NU 3 
#endif
  // # of threads
  #define P_PRE 256 
  #define NT 17// or NU = 2 & NT = 16 
#ifndef NT1
#define NT1 17
#endif
#ifndef NT2
  #define NT2 4
#endif
  #define NT3 1

#ifndef BUFFER
#define BUFFER 30
#endif
  //
  void packarc(int           row, // # of rows
               int           col, // # of cols
               const double *mt,
               int           inc, // distance
               double       *bk);
  //
  void packbrr(int           row, // # of rows
               int           col, // # of cols
               const double *mt,
               int           inc, // distance
               double       *bk);
  //
  // Packing B, r-major -> r-major
  /*void packpbrr(int           row, // # of rows
                int           col, // # of cols
                const double *mt,
                int           inc, // distance
                double       *bk);*/
  //
  void micro_kernel0(int                    k,
                     const double *A,
                     const double *B,
                     double       *C,
                     int                    ncol);
  //
  void micro_kernel1(int                    k,
                     const double *A,
                     const double *B,
                     double       *C,
                     int                    ncol);
  //
  void micro_dxpy(int                    m,
                  int                    n,
                  double       *C,
                  const double *D,
                  int                    ncol);
  //
  void ijrloop(const int              m,
               const int              n,
               const int              ni,
               const int              k,
               const int              ki,
               const double *A,
               const int              la,
               const double *B,
               double       *C,
               const int              lc);
  //
  void user_dgemm(const int              m,
                  const int              n,
                  const int              k,
                  const double *A,
                  const int              la, // distance
                  const double *B,
                  const int              lb, // distance
                  double       *C,
                  const int              lc);
  //
  //
#endif
