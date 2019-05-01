# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 17.0.1.132 Build 20161005";
# mark_description "-I/home/share/CLUSTER/31x8/src -I/home/share/CLUSTER/31x8 -qopenmp -lmemkind -O2 -xMIC-AVX512 -mkl -S";
	.file "generators.c"
	.text
..TXTST0:
# -- Begin  col_major_matrix
	.text
# mark_begin;
# Threads 2
        .align    16,0x90
	.globl col_major_matrix
# --- col_major_matrix(double *, const int, const int, const int, const double, const double)
col_major_matrix:
# parameter 1: %rdi
# parameter 2: %esi
# parameter 3: %edx
# parameter 4: %ecx
# parameter 5: %xmm0
# parameter 6: %xmm1
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_col_major_matrix.1:
..L2:
                                                          #10.1
        subq      $72, %rsp                                     #10.1 c1
	.cfi_def_cfa_offset 80
        movq      %r15, 32(%rsp)                                #10.1[spill] c3
	.cfi_offset 15, -48
        movl      %edx, %r15d                                   #10.1 c3
        movq      %r14, 24(%rsp)                                #10.1[spill] c3
	.cfi_offset 14, -56
        movl      %esi, %r14d                                   #10.1 c3
        movq      %r13, 16(%rsp)                                #10.1[spill] c5
	.cfi_offset 13, -64
        movq      %rdi, %r13                                    #10.1 c5
        movq      %r12, 8(%rsp)                                 #10.1[spill] c5
        movl      $8388608, %esi                                #14.3 c5
        vmovsd    %xmm1, 56(%rsp)                               #10.1[spill] c7
        lea       40(%rsp), %rdi                                #14.3 c7
        vmovsd    %xmm0, 48(%rsp)                               #10.1[spill] c9
        movl      %ecx, %edx                                    #14.3 c9
	.cfi_offset 12, -72
        movslq    %r14d, %r12                                   #10.1 c9
..___tag_value_col_major_matrix.8:
#       vslNewStream(VSLStreamStatePtr *, const int, const unsigned int)
        call      vslNewStream                                  #14.3
..___tag_value_col_major_matrix.9:
                                # LOE rbx rbp r12 r13 r14d r15d
..B1.2:                         # Preds ..B1.1
                                # Execution count [1.00e+00]
        xorl      %eax, %eax                                    #16.7 c1
        testl     %r15d, %r15d                                  #16.18 c1
        jle       ..B1.7        # Prob 10%                      #16.18 c3
                                # LOE rbx rbp r12 r13 eax r14d r15d
..B1.3:                         # Preds ..B1.2
                                # Execution count [9.00e-01]
        movq      %rbx, (%rsp)                                  #[spill] c1
	.cfi_offset 3, -80
        movl      %eax, %ebx                                    # c1
                                # LOE rbp r12 r13 ebx r14d r15d
..B1.4:                         # Preds ..B1.5 ..B1.3
                                # Execution count [5.00e+00]
        movl      $1073741824, %edi                             #18.5 c1
        movq      40(%rsp), %rsi                                #18.5 c1
        vmovsd    48(%rsp), %xmm0                               #18.5[spill] c1
        movl      %r14d, %edx                                   #18.5 c1
        movq      %r13, %rcx                                    #18.5 c3
        vmovsd    56(%rsp), %xmm1                               #18.5[spill] c5
..___tag_value_col_major_matrix.11:
#       vdRngUniform(const int, VSLStreamStatePtr, const int, double *, const double, const double)
        call      vdRngUniform                                  #18.5
..___tag_value_col_major_matrix.12:
                                # LOE rbp r12 r13 ebx r14d r15d
..B1.5:                         # Preds ..B1.4
                                # Execution count [5.00e+00]
        addl      $1, %ebx                                      #16.26 c1
        lea       (%r13,%r12,8), %r13                           #16.26 c1
        cmpl      %r15d, %ebx                                   #16.18 c3
        jl        ..B1.4        # Prob 82%                      #16.18 c5
                                # LOE rbp r12 r13 ebx r14d r15d
..B1.6:                         # Preds ..B1.5
                                # Execution count [9.00e-01]
        movq      (%rsp), %rbx                                  #[spill] c1
	.cfi_restore 3
                                # LOE rbx rbp
..B1.7:                         # Preds ..B1.6 ..B1.2
                                # Execution count [1.00e+00]
        lea       40(%rsp), %rdi                                #20.3 c1
..___tag_value_col_major_matrix.14:
#       vslDeleteStream(VSLStreamStatePtr *)
        call      vslDeleteStream                               #20.3
..___tag_value_col_major_matrix.15:
                                # LOE rbx rbp
..B1.8:                         # Preds ..B1.7
                                # Execution count [1.00e+00]
        movq      8(%rsp), %r12                                 #21.1[spill] c1
	.cfi_restore 12
        movq      16(%rsp), %r13                                #21.1[spill] c1
	.cfi_restore 13
        movq      24(%rsp), %r14                                #21.1[spill] c5 stall 1
	.cfi_restore 14
        movq      32(%rsp), %r15                                #21.1[spill] c5
	.cfi_restore 15
        addq      $72, %rsp                                     #21.1 c5
	.cfi_def_cfa_offset 8
        ret                                                     #21.1 c7
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	col_major_matrix,@function
	.size	col_major_matrix,.-col_major_matrix
	.data
# -- End  col_major_matrix
	.text
# -- Begin  row_major_matrix
	.text
# mark_begin;
# Threads 2
        .align    16,0x90
	.globl row_major_matrix
# --- row_major_matrix(double *, const int, const int, const int, const double, const double)
row_major_matrix:
# parameter 1: %rdi
# parameter 2: %esi
# parameter 3: %edx
# parameter 4: %ecx
# parameter 5: %xmm0
# parameter 6: %xmm1
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_row_major_matrix.22:
..L23:
                                                         #30.1
        subq      $72, %rsp                                     #30.1 c1
	.cfi_def_cfa_offset 80
        movq      %r15, 32(%rsp)                                #30.1[spill] c3
	.cfi_offset 15, -48
        movl      %edx, %r15d                                   #30.1 c3
        movq      %r14, 24(%rsp)                                #30.1[spill] c3
	.cfi_offset 14, -56
        movl      %esi, %r14d                                   #30.1 c3
        movq      %r13, 16(%rsp)                                #30.1[spill] c5
	.cfi_offset 13, -64
        movq      %rdi, %r13                                    #30.1 c5
        movq      %r12, 8(%rsp)                                 #30.1[spill] c5
        movl      $8388608, %esi                                #34.3 c5
        vmovsd    %xmm1, 56(%rsp)                               #30.1[spill] c7
        lea       40(%rsp), %rdi                                #34.3 c7
        vmovsd    %xmm0, 48(%rsp)                               #30.1[spill] c9
        movl      %ecx, %edx                                    #34.3 c9
	.cfi_offset 12, -72
        movslq    %r15d, %r12                                   #30.1 c9
..___tag_value_row_major_matrix.29:
#       vslNewStream(VSLStreamStatePtr *, const int, const unsigned int)
        call      vslNewStream                                  #34.3
..___tag_value_row_major_matrix.30:
                                # LOE rbx rbp r12 r13 r14d r15d
..B2.2:                         # Preds ..B2.1
                                # Execution count [1.00e+00]
        xorl      %eax, %eax                                    #36.7 c1
        testl     %r14d, %r14d                                  #36.18 c1
        jle       ..B2.7        # Prob 10%                      #36.18 c3
                                # LOE rbx rbp r12 r13 eax r14d r15d
..B2.3:                         # Preds ..B2.2
                                # Execution count [9.00e-01]
        movq      %rbx, (%rsp)                                  #[spill] c1
	.cfi_offset 3, -80
        movl      %eax, %ebx                                    # c1
                                # LOE rbp r12 r13 ebx r14d r15d
..B2.4:                         # Preds ..B2.5 ..B2.3
                                # Execution count [5.00e+00]
        movl      $1073741824, %edi                             #38.5 c1
        movq      40(%rsp), %rsi                                #38.5 c1
        vmovsd    48(%rsp), %xmm0                               #38.5[spill] c1
        movl      %r15d, %edx                                   #38.5 c1
        movq      %r13, %rcx                                    #38.5 c3
        vmovsd    56(%rsp), %xmm1                               #38.5[spill] c5
..___tag_value_row_major_matrix.32:
#       vdRngUniform(const int, VSLStreamStatePtr, const int, double *, const double, const double)
        call      vdRngUniform                                  #38.5
..___tag_value_row_major_matrix.33:
                                # LOE rbp r12 r13 ebx r14d r15d
..B2.5:                         # Preds ..B2.4
                                # Execution count [5.00e+00]
        addl      $1, %ebx                                      #36.26 c1
        lea       (%r13,%r12,8), %r13                           #36.26 c1
        cmpl      %r14d, %ebx                                   #36.18 c3
        jl        ..B2.4        # Prob 82%                      #36.18 c5
                                # LOE rbp r12 r13 ebx r14d r15d
..B2.6:                         # Preds ..B2.5
                                # Execution count [9.00e-01]
        movq      (%rsp), %rbx                                  #[spill] c1
	.cfi_restore 3
                                # LOE rbx rbp
..B2.7:                         # Preds ..B2.6 ..B2.2
                                # Execution count [1.00e+00]
        lea       40(%rsp), %rdi                                #40.3 c1
..___tag_value_row_major_matrix.35:
#       vslDeleteStream(VSLStreamStatePtr *)
        call      vslDeleteStream                               #40.3
..___tag_value_row_major_matrix.36:
                                # LOE rbx rbp
..B2.8:                         # Preds ..B2.7
                                # Execution count [1.00e+00]
        movq      8(%rsp), %r12                                 #41.1[spill] c1
	.cfi_restore 12
        movq      16(%rsp), %r13                                #41.1[spill] c1
	.cfi_restore 13
        movq      24(%rsp), %r14                                #41.1[spill] c5 stall 1
	.cfi_restore 14
        movq      32(%rsp), %r15                                #41.1[spill] c5
	.cfi_restore 15
        addq      $72, %rsp                                     #41.1 c5
	.cfi_def_cfa_offset 8
        ret                                                     #41.1 c7
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	row_major_matrix,@function
	.size	row_major_matrix,.-row_major_matrix
	.data
# -- End  row_major_matrix
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
# End
