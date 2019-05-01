# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 17.0.1.132 Build 20161005";
# mark_description "-I/home/share/CLUSTER/31x8/src -I/home/share/CLUSTER/31x8 -qopenmp -lmemkind -O2 -xMIC-AVX512 -mkl -S";
	.file "run.c"
	.text
..TXTST0:
# -- Begin  main
	.text
# mark_begin;
# Threads 2
        .align    16,0x90
	.globl main
# --- main(int, char **)
main:
# parameter 1: %edi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_main.1:
..L2:
                                                          #10.1
        pushq     %rbp                                          #10.1
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #10.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #10.1
        subq      $128, %rsp                                    #10.1 c1
        movq      %rbx, 8(%rsp)                                 #10.1[spill] c3
        movq      $0x7389d9ffe, %rsi                            #10.1 c3
        movq      %r15, 16(%rsp)                                #10.1[spill] c3
        movl      $3, %edi                                      #10.1 c3
        movq      %r14, 24(%rsp)                                #10.1[spill] c5
        call      __intel_new_feature_proc_init                 #10.1 c5
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x98, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x90, 0xff, 0xff, 0xff, 0x22
                                # LOE r12 r13
..B1.26:                        # Preds ..B1.1
                                # Execution count [0.00e+00]
        vstmxcsr  (%rsp)                                        #10.1 c1
        movl      $.2.3_2_kmpc_loc_struct_pack.3, %edi          #10.1 c1
        orl       $32832, (%rsp)                                #10.1 c3
        xorl      %esi, %esi                                    #10.1 c3
        xorl      %eax, %eax                                    #10.1 c3
        vldmxcsr  (%rsp)                                        #10.1 c5
..___tag_value_main.9:
        call      __kmpc_begin                                  #10.1
..___tag_value_main.10:
                                # LOE r12 r13
..B1.2:                         # Preds ..B1.26
                                # Execution count [1.00e+00]
        movl      $809472000, %edi                              #35.18 c1
..___tag_value_main.11:
#       hbw_malloc(size_t)
        call      hbw_malloc                                    #35.18
..___tag_value_main.12:
                                # LOE rax r12 r13
..B1.27:                        # Preds ..B1.2
                                # Execution count [1.00e+00]
        movq      %rax, %r14                                    #35.18 c1
                                # LOE r12 r13 r14
..B1.3:                         # Preds ..B1.27
                                # Execution count [1.00e+00]
        movq      %r14, %rdi                                    #36.3 c1
        movl      $64, %esi                                     #36.3 c1
        movl      $809472000, %edx                              #36.3 c3
..___tag_value_main.13:
#       hbw_posix_memalign(void **, size_t, size_t)
        call      hbw_posix_memalign                            #36.3
..___tag_value_main.14:
                                # LOE r12 r13 r14
..B1.4:                         # Preds ..B1.3
                                # Execution count [1.00e+00]
        movl      $809472000, %edi                              #37.18 c1
..___tag_value_main.15:
#       hbw_malloc(size_t)
        call      hbw_malloc                                    #37.18
..___tag_value_main.16:
                                # LOE rax r12 r13 r14
..B1.28:                        # Preds ..B1.4
                                # Execution count [1.00e+00]
        movq      %rax, %r15                                    #37.18 c1
                                # LOE r12 r13 r14 r15
..B1.5:                         # Preds ..B1.28
                                # Execution count [1.00e+00]
        movq      %r15, %rdi                                    #38.3 c1
        movl      $64, %esi                                     #38.3 c1
        movl      $809472000, %edx                              #38.3 c3
..___tag_value_main.17:
#       hbw_posix_memalign(void **, size_t, size_t)
        call      hbw_posix_memalign                            #38.3
..___tag_value_main.18:
                                # LOE r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5
                                # Execution count [1.00e+00]
        movq      $0x0d3e3f200, %rdi                            #39.18 c1
..___tag_value_main.19:
#       hbw_malloc(size_t)
        call      hbw_malloc                                    #39.18
..___tag_value_main.20:
                                # LOE rax r12 r13 r14 r15
..B1.29:                        # Preds ..B1.6
                                # Execution count [1.00e+00]
        movq      %rax, %rbx                                    #39.18 c1
                                # LOE rbx r12 r13 r14 r15
..B1.7:                         # Preds ..B1.29
                                # Execution count [1.00e+00]
        movq      %rbx, %rdi                                    #40.3 c1
        movl      $64, %esi                                     #40.3 c1
        movq      $0x0d3e3f200, %rdx                            #40.3 c3
..___tag_value_main.21:
#       hbw_posix_memalign(void **, size_t, size_t)
        call      hbw_posix_memalign                            #40.3
..___tag_value_main.22:
                                # LOE rbx r12 r13 r14 r15
..B1.8:                         # Preds ..B1.7
                                # Execution count [1.00e+00]
        movq      %r14, %rdi                                    #42.3 c1
        movl      $21080, %esi                                  #42.3 c1
        vmovsd    .L_2il0floatpacket.0(%rip), %xmm0             #42.3 c1
        vmovsd    .L_2il0floatpacket.6(%rip), %xmm1             #42.3 c1
        movl      $4800, %edx                                   #42.3 c3
        movl      $777, %ecx                                    #42.3 c3
..___tag_value_main.23:
#       row_major_matrix(double *, const int, const int, const int, const double, const double)
        call      row_major_matrix                              #42.3
..___tag_value_main.24:
                                # LOE rbx r12 r13 r14 r15
..B1.9:                         # Preds ..B1.8
                                # Execution count [1.00e+00]
        movq      %r15, %rdi                                    #43.3 c1
        movl      $4800, %esi                                   #43.3 c1
        vmovsd    .L_2il0floatpacket.1(%rip), %xmm0             #43.3 c1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm1             #43.3 c1
        movl      $21080, %edx                                  #43.3 c3
        movl      $888, %ecx                                    #43.3 c3
..___tag_value_main.25:
#       row_major_matrix(double *, const int, const int, const int, const double, const double)
        call      row_major_matrix                              #43.3
..___tag_value_main.26:
                                # LOE rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.9
                                # Execution count [1.00e+00]
        movl      $21080, %esi                                  #44.3 c1
        movq      %rbx, %rdi                                    #44.3 c1
        vmovsd    .L_2il0floatpacket.3(%rip), %xmm0             #44.3 c1
        vmovsd    .L_2il0floatpacket.4(%rip), %xmm1             #44.3 c1
        movl      %esi, %edx                                    #44.3 c3
        movl      $999, %ecx                                    #44.3 c3
..___tag_value_main.27:
#       row_major_matrix(double *, const int, const int, const int, const double, const double)
        call      row_major_matrix                              #44.3
..___tag_value_main.28:
                                # LOE rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.10
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.0, %edi                         #49.2 c1
        movl      $576, %esi                                    #49.2 c1
        movl      $144, %edx                                    #49.2 c3
        movl      $400, %ecx                                    #49.2 c3
        xorl      %eax, %eax                                    #49.2 c5
..___tag_value_main.29:
#       printf(const char *__restrict__, ...)
        call      printf                                        #49.2
..___tag_value_main.30:
                                # LOE rbx r12 r13 r14 r15
..B1.12:                        # Preds ..B1.11
                                # Execution count [1.00e+00]
        vxorpd    %xmm1, %xmm1, %xmm1                           #67.5 c1
        movq      %r12, 32(%rsp)                                #67.5[spill] c1
        movq      %r13, (%rsp)                                  #67.5[spill] c1
        vxorpd    %xmm0, %xmm0, %xmm0                           #67.5 c1
        xorb      %dl, %dl                                      #53.7 c1
        movl      $21080, %eax                                  #59.4 c1
        vgetmantsd $0, .L_2il0floatpacket.5(%rip), %xmm1, %xmm1 #67.5 c3
        vmovsd    %xmm1, 48(%rsp)                               #67.5[spill] c9 stall 2
        vgetexpsd .L_2il0floatpacket.5(%rip), %xmm0, %xmm0      #67.5 c9
        vmovsd    %xmm0, 40(%rsp)                               #67.5[spill] c15 stall 2
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xa0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x22
        movl      %eax, %r12d                                   #67.5 c15
        movb      %dl, %r13b                                    #67.5 c15
                                # LOE rbx r14 r15 r12d r13b
..B1.13:                        # Preds ..B1.18 ..B1.12
                                # Execution count [4.00e+00]
        movl      $35651584, %edi                               #55.31 c1
        movl      $64, %esi                                     #55.31 c1
#       calloc(size_t, size_t)
        call      calloc                                        #55.31 c3
                                # LOE rbx r14 r15 r12d r13b
..B1.14:                        # Preds ..B1.13
                                # Execution count [4.00e+00]
..___tag_value_main.33:
#       omp_get_wtime(void)
        call      omp_get_wtime                                 #56.17
..___tag_value_main.34:
                                # LOE rbx r14 r15 r12d r13b xmm0
..B1.30:                        # Preds ..B1.14
                                # Execution count [4.00e+00]
        vmovsd    %xmm0, 56(%rsp)                               #56.17[spill] c1
                                # LOE rbx r14 r15 r12d r13b
..B1.15:                        # Preds ..B1.30
                                # Execution count [4.00e+00]
        vmovsd    .L_2il0floatpacket.6(%rip), %xmm0             #59.4 c1
        movl      $111, %esi                                    #59.4 c1
        movl      $21080, %ecx                                  #59.4 c1
        addq      $-48, %rsp                                    #59.4 c3
        movq      %r14, (%rsp)                                  #59.4 c5
        movl      $101, %edi                                    #59.4 c5
        movl      $4800, 8(%rsp)                                #59.4 c7
        movl      %esi, %edx                                    #59.4 c7
        movq      %r15, 16(%rsp)                                #59.4 c7
        movl      %ecx, %r8d                                    #59.4 c7
        movl      %r12d, 24(%rsp)                               #59.4 c9
        movl      $4800, %r9d                                   #59.4 c9
        movq      %rbx, 32(%rsp)                                #59.4 c9
        vmovapd   %xmm0, %xmm1                                  #59.4 c9
        movl      %r12d, 40(%rsp)                               #59.4 c11
..___tag_value_main.35:
#       cblas_dgemm(const CBLAS_LAYOUT, const CBLAS_TRANSPOSE, const CBLAS_TRANSPOSE, const int, const int, const int, const double, const double *, const int, const double *, const int, const double, double *, const int)
        call      cblas_dgemm                                   #59.4
..___tag_value_main.36:
                                # LOE rbx r14 r15 r12d r13b
..B1.31:                        # Preds ..B1.15
                                # Execution count [4.00e+00]
        addq      $48, %rsp                                     #59.4 c1
                                # LOE rbx r14 r15 r12d r13b
..B1.16:                        # Preds ..B1.31
                                # Execution count [4.00e+00]
..___tag_value_main.37:
#       omp_get_wtime(void)
        call      omp_get_wtime                                 #63.15
..___tag_value_main.38:
                                # LOE rbx r14 r15 r12d r13b xmm0
..B1.17:                        # Preds ..B1.16
                                # Execution count [4.00e+00]
        vsubsd    56(%rsp), %xmm0, %xmm0                        #65.31[spill] c1
        vmovsd    .L_2il0floatpacket.6(%rip), %xmm18            #67.5 c1
        movl      $.L_2__STRING.1, %edi                         #67.5 c1
        movl      $2, %eax                                      #67.5 c1
        vgetmantsd $0, %xmm0, %xmm0, %xmm20                     #67.5 c7 stall 2
        vmovsd    48(%rsp), %xmm19                              #67.5[spill] c7
        vgetexpsd %xmm0, %xmm0, %xmm17                          #67.5 c7
        vmovsd    40(%rsp), %xmm16                              #67.5[spill] c7
        vrcp28sd  %xmm20, %xmm20, %xmm21                        #67.5 c13 stall 2
        vsubsd    %xmm17, %xmm16, %xmm23                        #67.5 c13
        vfnmadd231sd {rn-sae}, %xmm20, %xmm21, %xmm18           #67.5 c21 stall 3
        vmulsd    {rn-sae}, %xmm19, %xmm21, %xmm22              #67.5 c21
        vfmadd231sd {rn-sae}, %xmm21, %xmm18, %xmm21            #67.5 c27 stall 2
        vfnmadd213sd {rn-sae}, %xmm19, %xmm22, %xmm20           #67.5 c27
        vfmadd231sd {rn-sae}, %xmm21, %xmm20, %xmm22            #67.5 c33 stall 2
        vscalefsd %xmm23, %xmm22, %xmm1                         #67.5 c39 stall 2
..___tag_value_main.39:
#       printf(const char *__restrict__, ...)
        call      printf                                        #67.5
..___tag_value_main.40:
                                # LOE rbx r14 r15 r12d r13b
..B1.18:                        # Preds ..B1.17
                                # Execution count [4.00e+00]
        addb      $1, %r13b                                     #53.26 c1
        cmpb      $4, %r13b                                     #53.18 c3
        jl        ..B1.13       # Prob 75%                      #53.18 c5
                                # LOE rbx r14 r15 r12d r13b
..B1.19:                        # Preds ..B1.18
                                # Execution count [1.00e+00]
        movq      %r14, %rdi                                    #75.3 c1
        movq      32(%rsp), %r12                                #[spill] c1
	.cfi_restore 12
        movq      (%rsp), %r13                                  #[spill] c1
	.cfi_restore 13
..___tag_value_main.43:
#       hbw_free(void *)
        call      hbw_free                                      #75.3
..___tag_value_main.44:
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xa0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x22
                                # LOE rbx r12 r13 r15
..B1.20:                        # Preds ..B1.19
                                # Execution count [1.00e+00]
        movq      %r15, %rdi                                    #76.3 c1
..___tag_value_main.47:
#       hbw_free(void *)
        call      hbw_free                                      #76.3
..___tag_value_main.48:
                                # LOE rbx r12 r13
..B1.21:                        # Preds ..B1.20
                                # Execution count [1.00e+00]
        movq      %rbx, %rdi                                    #77.3 c1
..___tag_value_main.49:
#       hbw_free(void *)
        call      hbw_free                                      #77.3
..___tag_value_main.50:
                                # LOE r12 r13
..B1.22:                        # Preds ..B1.21
                                # Execution count [1.00e+00]
        movl      $.2.3_2_kmpc_loc_struct_pack.14, %edi         #79.3 c1
        xorl      %eax, %eax                                    #79.3 c1
..___tag_value_main.51:
        call      __kmpc_end                                    #79.3
..___tag_value_main.52:
                                # LOE r12 r13
..B1.23:                        # Preds ..B1.22
                                # Execution count [1.00e+00]
        movq      8(%rsp), %rbx                                 #79.3[spill] c1
	.cfi_restore 3
        movq      24(%rsp), %r14                                #79.3[spill] c1
	.cfi_restore 14
        xorl      %eax, %eax                                    #79.3 c1
        movq      16(%rsp), %r15                                #79.3[spill] c5 stall 1
	.cfi_restore 15
        movq      %rbp, %rsp                                    #79.3 c7
        popq      %rbp                                          #79.3
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #79.3
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
	.data
	.align 4
	.align 4
.2.3_2_kmpc_loc_struct_pack.3:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.2
	.align 4
.2.3_2__kmpc_loc_pack.2:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	49
	.byte	48
	.byte	59
	.byte	49
	.byte	48
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.3_2_kmpc_loc_struct_pack.14:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.13
	.align 4
.2.3_2__kmpc_loc_pack.13:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	55
	.byte	57
	.byte	59
	.byte	55
	.byte	57
	.byte	59
	.byte	59
	.data
# -- End  main
	.section .rodata, "a"
	.align 8
	.align 8
.L_2il0floatpacket.0:
	.long	0x00000000,0xbff00000
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,8
	.align 8
.L_2il0floatpacket.1:
	.long	0x00000000,0xc0240000
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,8
	.align 8
.L_2il0floatpacket.2:
	.long	0x00000000,0x40240000
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,8
	.align 8
.L_2il0floatpacket.3:
	.long	0x00000000,0xc0340000
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,8
	.align 8
.L_2il0floatpacket.4:
	.long	0x00000000,0x40340000
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,8
	.align 8
.L_2il0floatpacket.5:
	.long	0xdd590c0b,0x40b0a9ea
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,8
	.align 8
.L_2il0floatpacket.6:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.6,@object
	.size	.L_2il0floatpacket.6,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.long	1147089228
	.long	1599361865
	.long	622856513
	.long	1277176932
	.long	1229217585
	.long	1113543763
	.long	1680154633
	.long	1651187756
	.long	1680154633
	.word	10
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,38
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.long	1835362148
	.long	1769218157
	.long	673211757
	.long	694379891
	.long	744891657
	.long	1818642208
	.long	158560367
	.long	169895461
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,33
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
# End
