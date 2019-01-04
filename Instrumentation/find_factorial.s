	.file	"find_factorial.c"
	.text
.Ltext0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Enter an integer: "
.LC3:
	.string	"%d"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"Error! Factorial of a negative number doesn't exist."
	.section	.rodata.str1.1
.LC6:
	.string	"Factorial of %d = %llu"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB7:
	.section	.text.startup,"ax",@progbits
.LHOTB7:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.section	.text.startup
	.globl	main
	.type	main, @function
main:
.LFB23:
	.file 1 "./find_factorial.c"
	.loc 1 4 0
	.cfi_startproc

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00004de6, %rcx
movl $0x00004de6, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	subq	$24, %rsp
	.cfi_def_cfa_offset 32
.LBB8:
.LBB9:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 104 0
	movl	$.LC2, %esi
	movl	$1, %edi
.LBE9:
.LBE8:
	.loc 1 4 0
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
.LVL0:
.LBB11:
.LBB10:
	.loc 2 104 0
	call	__printf_chk
.LVL1:
.LBE10:
.LBE11:
	.loc 1 9 0
	leaq	4(%rsp), %rsi
	xorl	%eax, %eax
	movl	$.LC3, %edi
	call	__isoc99_scanf
.LVL2:
	.loc 1 12 0
	movl	4(%rsp), %edx
	testl	%edx, %edx
	js	.L2

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000008b9, %rcx
movl $0x000008b9, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LVL3:
	.loc 1 17 0 discriminator 1
	movl	$1, %ecx
	je	.L4

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00005694, %rcx
movl $0x00005694, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leal	-4(%rdx), %eax
	leal	-1(%rdx), %edi
	shrl	$2, %eax
	cmpl	$5, %edi
	leal	1(%rax), %ecx
	leal	0(,%rcx,4), %esi
	jbe	.L13

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000994c, %rcx
movl $0x0000994c, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LVL4:
	.loc 1 19 0
	pxor	%xmm5, %xmm5
	.loc 1 17 0
	movdqa	.LC1(%rip), %xmm6
	andl	$1, %eax
	cmpl	$1, %ecx
	movl	$1, %r8d
	.loc 1 19 0
	movdqa	%xmm6, %xmm0
	movdqa	%xmm5, %xmm7
	movdqa	%xmm6, %xmm9
	.loc 1 17 0
	movdqa	.LC0(%rip), %xmm3
	.loc 1 19 0
	pcmpgtd	%xmm6, %xmm7
	movdqa	%xmm3, %xmm1
	movdqa	.LC5(%rip), %xmm4
	punpckldq	%xmm7, %xmm0
	punpckhdq	%xmm7, %xmm9
	psrlq	$32, %xmm1
	paddd	%xmm4, %xmm6
	movdqa	%xmm6, %xmm12
	movdqa	%xmm0, %xmm2
	movdqa	%xmm0, %xmm8
	pmuludq	%xmm1, %xmm0
	movdqa	%xmm9, %xmm10
	pmuludq	%xmm3, %xmm2
	movdqa	%xmm9, %xmm1
	psrlq	$32, %xmm8
	pmuludq	%xmm8, %xmm3
	paddq	%xmm3, %xmm0
	psllq	$32, %xmm0
	paddq	%xmm0, %xmm2
	movdqa	%xmm2, %xmm11
	pmuludq	%xmm2, %xmm1
	psrlq	$32, %xmm10
	pmuludq	%xmm10, %xmm2
	psrlq	$32, %xmm11
	pmuludq	%xmm11, %xmm9
	paddq	%xmm9, %xmm2
	psllq	$32, %xmm2
	paddq	%xmm2, %xmm1
	jbe	.L21

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ba7, %rcx
movl $0x00000ba7, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	testl	%eax, %eax
	je	.L7

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000eec5, %rcx
movl $0x0000eec5, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movdqa	%xmm5, %xmm13
	movdqa	%xmm6, %xmm14
	movdqa	%xmm12, %xmm2
	cmpl	$2, %ecx
	paddd	%xmm4, %xmm12
	pcmpgtd	%xmm6, %xmm13
	movdqa	%xmm1, %xmm6
	movl	$2, %r8d
	punpckldq	%xmm13, %xmm14
	psrlq	$32, %xmm6
	punpckhdq	%xmm13, %xmm2
	movdqa	%xmm14, %xmm15
	movdqa	%xmm14, %xmm3
	movdqa	%xmm2, %xmm7
	pmuludq	%xmm6, %xmm14
	pmuludq	%xmm1, %xmm15
	psrlq	$32, %xmm3
	pmuludq	%xmm3, %xmm1
	paddq	%xmm14, %xmm1
	psllq	$32, %xmm1
	paddq	%xmm1, %xmm15
	movdqa	%xmm2, %xmm1
	movdqa	%xmm15, %xmm0
	psrlq	$32, %xmm7
	pmuludq	%xmm15, %xmm1
	pmuludq	%xmm7, %xmm15
	psrlq	$32, %xmm0
	pmuludq	%xmm0, %xmm2
	paddq	%xmm2, %xmm15
	psllq	$32, %xmm15
	paddq	%xmm15, %xmm1
	jbe	.L21

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000002, %rcx
movl $0x00000002, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.L7:
	.loc 1 19 0 is_stmt 0 discriminator 3

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00005d0a, %rcx
movl $0x00005d0a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movdqa	%xmm5, %xmm8
	movdqa	%xmm12, %xmm11
	movdqa	%xmm12, %xmm10
	addl	$2, %r8d
	pcmpgtd	%xmm12, %xmm8
	movdqa	%xmm1, %xmm9
	paddd	%xmm4, %xmm10
	cmpl	%r8d, %ecx
	punpckldq	%xmm8, %xmm11
	psrlq	$32, %xmm9
	punpckhdq	%xmm8, %xmm12
	movdqa	%xmm10, %xmm8
	movdqa	%xmm11, %xmm13
	movdqa	%xmm11, %xmm14
	movdqa	%xmm12, %xmm15
	pmuludq	%xmm9, %xmm11
	pmuludq	%xmm1, %xmm13
	movdqa	%xmm12, %xmm3
	psrlq	$32, %xmm14
	pmuludq	%xmm14, %xmm1
	paddq	%xmm11, %xmm1
	psllq	$32, %xmm1
	paddq	%xmm1, %xmm13
	movdqa	%xmm13, %xmm6
	pmuludq	%xmm13, %xmm15
	psrlq	$32, %xmm3
	pmuludq	%xmm3, %xmm13
	psrlq	$32, %xmm6
	pmuludq	%xmm6, %xmm12
	paddq	%xmm13, %xmm12
	psllq	$32, %xmm12
	paddq	%xmm12, %xmm15
	movdqa	%xmm5, %xmm12
	movdqa	%xmm10, %xmm1
	movdqa	%xmm15, %xmm7
	pcmpgtd	%xmm10, %xmm12
	paddd	%xmm4, %xmm10
	psrlq	$32, %xmm7
	punpckldq	%xmm12, %xmm1
	punpckhdq	%xmm12, %xmm8
	movdqa	%xmm10, %xmm12
	movdqa	%xmm1, %xmm2
	movdqa	%xmm1, %xmm0
	movdqa	%xmm8, %xmm11
	pmuludq	%xmm7, %xmm1
	pmuludq	%xmm15, %xmm2
	movdqa	%xmm8, %xmm13
	psrlq	$32, %xmm0
	pmuludq	%xmm0, %xmm15
	paddq	%xmm15, %xmm1
	psllq	$32, %xmm1
	paddq	%xmm1, %xmm2
	movdqa	%xmm8, %xmm1
	movdqa	%xmm2, %xmm14
	psrlq	$32, %xmm13
	pmuludq	%xmm2, %xmm1
	pmuludq	%xmm13, %xmm2
	psrlq	$32, %xmm14
	pmuludq	%xmm14, %xmm11
	paddq	%xmm11, %xmm2
	psllq	$32, %xmm2
	paddq	%xmm2, %xmm1
	ja	.L7

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000002, %rcx
movl $0x00000002, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.L21:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000699d, %rcx
movl $0x0000699d, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movdqa	%xmm1, %xmm5
	movdqa	%xmm1, %xmm4
	movdqa	%xmm1, %xmm10
	cmpl	%edx, %esi
	psrldq	$8, %xmm5
	movdqa	%xmm5, %xmm9
	pmuludq	%xmm5, %xmm4
	psrlq	$32, %xmm10
	leal	1(%rsi), %eax
	pmuludq	%xmm5, %xmm10
	psrlq	$32, %xmm9
	pmuludq	%xmm9, %xmm1
	paddq	%xmm1, %xmm10
	psllq	$32, %xmm10
	paddq	%xmm4, %xmm10
	movq	%xmm10, %rcx
	je	.L4

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000002, %rcx
movl $0x00000002, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.L6:
.LVL5:
	.loc 1 17 0 is_stmt 1

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000f00b, %rcx
movl $0x0000f00b, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leal	1(%rax), %r10d
	.loc 1 19 0
	movslq	%eax, %r9
	imulq	%r9, %rcx
.LVL6:
	.loc 1 17 0
	cmpl	%r10d, %edx
	jl	.L4

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000e815, %rcx
movl $0x0000e815, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leal	2(%rax), %edi
	.loc 1 19 0
	movslq	%r10d, %r11
	imulq	%r11, %rcx
.LVL7:
	.loc 1 17 0
	cmpl	%edi, %edx
	jl	.L4

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000e90a, %rcx
movl $0x0000e90a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leal	3(%rax), %esi
	.loc 1 19 0
	movslq	%edi, %r8
	imulq	%r8, %rcx
.LVL8:
	.loc 1 17 0
	cmpl	%esi, %edx
	jl	.L4

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000f01a, %rcx
movl $0x0000f01a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leal	4(%rax), %r10d
	.loc 1 19 0
	movslq	%esi, %r9
	imulq	%r9, %rcx
.LVL9:
	.loc 1 17 0
	cmpl	%r10d, %edx
	jl	.L4

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00006064, %rcx
movl $0x00006064, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 19 0
	movslq	%r10d, %r11
	.loc 1 17 0
	addl	$5, %eax
	.loc 1 19 0
	imulq	%r11, %rcx
.LVL10:
	.loc 1 17 0
	cmpl	%eax, %edx
	jl	.L4

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00001356, %rcx
movl $0x00001356, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 19 0
	cltq
	imulq	%rax, %rcx
.LVL11:
.L4:
.LBB12:
.LBB13:
	.loc 2 104 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000a64d, %rcx
movl $0x0000a64d, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC6, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.LVL12:
.L5:
.LBE13:
.LBE12:
	.loc 1 25 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000092e2, %rcx
movl $0x000092e2, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	xorl	%eax, %eax
	movq	8(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L24

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000bc2, %rcx
movl $0x00000bc2, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL13:
.L13:
	.cfi_restore_state
	.loc 1 17 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00001c3d, %rcx
movl $0x00001c3d, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$1, %ecx
	movl	$1, %eax
	jmp	.L6
.LVL14:
.L2:
.LBB14:
.LBB15:
	.loc 2 104 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000cc4b, %rcx
movl $0x0000cc4b, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC4, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.LVL15:
	jmp	.L5
.LVL16:
.L24:
.LBE15:
.LBE14:
	.loc 1 25 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00005335, %rcx
movl $0x00005335, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__stack_chk_fail
.LVL17:
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE7:
	.section	.text.startup
.LHOTE7:
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	1
	.quad	1
	.align 16
.LC1:
	.long	1
	.long	2
	.long	3
	.long	4
	.align 16
.LC5:
	.long	4
	.long	4
	.long	4
	.long	4
	.text
.Letext0:
	.section	.text.unlikely
.Letext_cold0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x431
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF50
	.byte	0xc
	.long	.LASF51
	.long	.LASF52
	.long	.Ldebug_ranges0+0x30
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x3
	.byte	0xd8
	.long	0x34
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0x83
	.long	0x65
	.uleb128 0x2
	.long	.LASF9
	.byte	0x4
	.byte	0x84
	.long	0x65
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x91
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x7
	.long	.LASF41
	.byte	0xd8
	.byte	0x5
	.byte	0xf1
	.long	0x215
	.uleb128 0x8
	.long	.LASF12
	.byte	0x5
	.byte	0xf2
	.long	0x5e
	.byte	0
	.uleb128 0x8
	.long	.LASF13
	.byte	0x5
	.byte	0xf7
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF14
	.byte	0x5
	.byte	0xf8
	.long	0x8b
	.byte	0x10
	.uleb128 0x8
	.long	.LASF15
	.byte	0x5
	.byte	0xf9
	.long	0x8b
	.byte	0x18
	.uleb128 0x8
	.long	.LASF16
	.byte	0x5
	.byte	0xfa
	.long	0x8b
	.byte	0x20
	.uleb128 0x8
	.long	.LASF17
	.byte	0x5
	.byte	0xfb
	.long	0x8b
	.byte	0x28
	.uleb128 0x8
	.long	.LASF18
	.byte	0x5
	.byte	0xfc
	.long	0x8b
	.byte	0x30
	.uleb128 0x8
	.long	.LASF19
	.byte	0x5
	.byte	0xfd
	.long	0x8b
	.byte	0x38
	.uleb128 0x8
	.long	.LASF20
	.byte	0x5
	.byte	0xfe
	.long	0x8b
	.byte	0x40
	.uleb128 0x9
	.long	.LASF21
	.byte	0x5
	.value	0x100
	.long	0x8b
	.byte	0x48
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.value	0x101
	.long	0x8b
	.byte	0x50
	.uleb128 0x9
	.long	.LASF23
	.byte	0x5
	.value	0x102
	.long	0x8b
	.byte	0x58
	.uleb128 0x9
	.long	.LASF24
	.byte	0x5
	.value	0x104
	.long	0x24d
	.byte	0x60
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.value	0x106
	.long	0x253
	.byte	0x68
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.value	0x108
	.long	0x5e
	.byte	0x70
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.value	0x10c
	.long	0x5e
	.byte	0x74
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.value	0x10e
	.long	0x6c
	.byte	0x78
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.value	0x112
	.long	0x42
	.byte	0x80
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.value	0x113
	.long	0x50
	.byte	0x82
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.value	0x114
	.long	0x259
	.byte	0x83
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.value	0x118
	.long	0x269
	.byte	0x88
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.value	0x121
	.long	0x77
	.byte	0x90
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.value	0x129
	.long	0x89
	.byte	0x98
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.value	0x12a
	.long	0x89
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.value	0x12b
	.long	0x89
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.value	0x12c
	.long	0x89
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.value	0x12e
	.long	0x29
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.value	0x12f
	.long	0x5e
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.value	0x131
	.long	0x26f
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF53
	.byte	0x5
	.byte	0x96
	.uleb128 0x7
	.long	.LASF42
	.byte	0x18
	.byte	0x5
	.byte	0x9c
	.long	0x24d
	.uleb128 0x8
	.long	.LASF43
	.byte	0x5
	.byte	0x9d
	.long	0x24d
	.byte	0
	.uleb128 0x8
	.long	.LASF44
	.byte	0x5
	.byte	0x9e
	.long	0x253
	.byte	0x8
	.uleb128 0x8
	.long	.LASF45
	.byte	0x5
	.byte	0xa2
	.long	0x5e
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x21c
	.uleb128 0x6
	.byte	0x8
	.long	0x98
	.uleb128 0xb
	.long	0x91
	.long	0x269
	.uleb128 0xc
	.long	0x82
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x215
	.uleb128 0xb
	.long	0x91
	.long	0x27f
	.uleb128 0xc
	.long	0x82
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x285
	.uleb128 0xd
	.long	0x91
	.uleb128 0xe
	.long	.LASF54
	.byte	0x2
	.byte	0x66
	.long	0x5e
	.byte	0x3
	.long	0x2a7
	.uleb128 0xf
	.long	.LASF55
	.byte	0x2
	.byte	0x66
	.long	0x2a7
	.uleb128 0x10
	.byte	0
	.uleb128 0x11
	.long	0x27f
	.uleb128 0x12
	.long	.LASF56
	.byte	0x1
	.byte	0x3
	.long	0x5e
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x3f3
	.uleb128 0x13
	.string	"n"
	.byte	0x1
	.byte	0x5
	.long	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.string	"i"
	.byte	0x1
	.byte	0x5
	.long	0x5e
	.long	.LLST0
	.uleb128 0x15
	.long	.LASF46
	.byte	0x1
	.byte	0x6
	.long	0x3f3
	.long	.LLST1
	.uleb128 0x16
	.long	0x28a
	.quad	.LBB8
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x8
	.long	0x336
	.uleb128 0x17
	.long	0x29a
	.long	.LLST2
	.uleb128 0x18
	.quad	.LVL1
	.long	0x410
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	0x28a
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.byte	0x1
	.byte	0x15
	.long	0x37b
	.uleb128 0x17
	.long	0x29a
	.long	.LLST3
	.uleb128 0x18
	.quad	.LVL12
	.long	0x410
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	0x28a
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.byte	0x1
	.byte	0xd
	.long	0x3c0
	.uleb128 0x17
	.long	0x29a
	.long	.LLST4
	.uleb128 0x18
	.quad	.LVL15
	.long	0x410
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.byte	0
	.byte	0
	.uleb128 0x1b
	.quad	.LVL2
	.long	0x41b
	.long	0x3e5
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1c
	.quad	.LVL17
	.long	0x42b
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF47
	.uleb128 0x1d
	.long	.LASF48
	.byte	0x6
	.byte	0xa8
	.long	0x253
	.uleb128 0x1d
	.long	.LASF49
	.byte	0x6
	.byte	0xa9
	.long	0x253
	.uleb128 0x1e
	.long	.LASF57
	.long	.LASF57
	.byte	0x2
	.byte	0x57
	.uleb128 0x1f
	.long	.LASF58
	.long	.LASF59
	.byte	0x6
	.value	0x1be
	.long	.LASF58
	.uleb128 0x20
	.long	.LASF60
	.long	.LASF60
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL3
	.quad	.LVL4
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL5
	.quad	.LVL6
	.value	0x1
	.byte	0x50
	.quad	.LVL6
	.quad	.LVL7
	.value	0x1
	.byte	0x5a
	.quad	.LVL7
	.quad	.LVL8
	.value	0x1
	.byte	0x55
	.quad	.LVL8
	.quad	.LVL9
	.value	0x1
	.byte	0x54
	.quad	.LVL9
	.quad	.LVL10
	.value	0x1
	.byte	0x5a
	.quad	.LVL13
	.quad	.LVL14
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0
	.quad	.LVL4
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL5
	.quad	.LVL11
	.value	0x1
	.byte	0x52
	.quad	.LVL13
	.quad	.LVL16
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL0
	.quad	.LVL1
	.value	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL11
	.quad	.LVL12
	.value	0xa
	.byte	0x3
	.quad	.LC6
	.byte	0x9f
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL14
	.quad	.LVL16
	.value	0xa
	.byte	0x3
	.quad	.LC4
	.byte	0x9f
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB8
	.quad	.LBE8
	.quad	.LBB11
	.quad	.LBE11
	.quad	0
	.quad	0
	.quad	.LFB23
	.quad	.LFE23
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF20:
	.string	"_IO_buf_end"
.LASF28:
	.string	"_old_offset"
.LASF57:
	.string	"__printf_chk"
.LASF51:
	.string	"./find_factorial.c"
.LASF59:
	.string	"scanf"
.LASF23:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF10:
	.string	"sizetype"
.LASF58:
	.string	"__isoc99_scanf"
.LASF33:
	.string	"_offset"
.LASF17:
	.string	"_IO_write_ptr"
.LASF12:
	.string	"_flags"
.LASF19:
	.string	"_IO_buf_base"
.LASF24:
	.string	"_markers"
.LASF14:
	.string	"_IO_read_end"
.LASF50:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -O3 -funroll-loops -fstack-protector-strong"
.LASF32:
	.string	"_lock"
.LASF6:
	.string	"long int"
.LASF46:
	.string	"factorial"
.LASF54:
	.string	"printf"
.LASF29:
	.string	"_cur_column"
.LASF45:
	.string	"_pos"
.LASF44:
	.string	"_sbuf"
.LASF41:
	.string	"_IO_FILE"
.LASF1:
	.string	"unsigned char"
.LASF4:
	.string	"signed char"
.LASF47:
	.string	"long long unsigned int"
.LASF3:
	.string	"unsigned int"
.LASF42:
	.string	"_IO_marker"
.LASF31:
	.string	"_shortbuf"
.LASF16:
	.string	"_IO_write_base"
.LASF40:
	.string	"_unused2"
.LASF52:
	.string	"/home/francis/Documents/ThesisWork/Instrumentation"
.LASF13:
	.string	"_IO_read_ptr"
.LASF2:
	.string	"short unsigned int"
.LASF11:
	.string	"char"
.LASF56:
	.string	"main"
.LASF43:
	.string	"_next"
.LASF34:
	.string	"__pad1"
.LASF35:
	.string	"__pad2"
.LASF36:
	.string	"__pad3"
.LASF37:
	.string	"__pad4"
.LASF38:
	.string	"__pad5"
.LASF55:
	.string	"__fmt"
.LASF0:
	.string	"long unsigned int"
.LASF18:
	.string	"_IO_write_end"
.LASF9:
	.string	"__off64_t"
.LASF8:
	.string	"__off_t"
.LASF25:
	.string	"_chain"
.LASF22:
	.string	"_IO_backup_base"
.LASF48:
	.string	"stdin"
.LASF27:
	.string	"_flags2"
.LASF39:
	.string	"_mode"
.LASF15:
	.string	"_IO_read_base"
.LASF30:
	.string	"_vtable_offset"
.LASF21:
	.string	"_IO_save_base"
.LASF26:
	.string	"_fileno"
.LASF60:
	.string	"__stack_chk_fail"
.LASF49:
	.string	"stdout"
.LASF53:
	.string	"_IO_lock_t"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits

/* --- AFL MAIN PAYLOAD (64-BIT) --- */

.text
.att_syntax
.code64
.align 8

__afl_maybe_log:

  lahf
  seto  %al

  /* Check if SHM region is already mapped. */

  movq  __afl_area_ptr(%rip), %rdx
  testq %rdx, %rdx
  je    __afl_setup

__afl_store:

  /* Calculate and store hit for the code location specified in rcx. */

  xorq __afl_prev_loc(%rip), %rcx
  xorq %rcx, __afl_prev_loc(%rip)
  shrq $1, __afl_prev_loc(%rip)

  incb (%rdx, %rcx, 1)
  
/* Write home and tell them the id of the block */
  movq $4, %rdx               /* length    */
  leaq __afl_block_temp, %rsi
  movq __fsrv_write, %rdi       /* file desc */
call write@PLT


__afl_return:

  addb $127, %al
  sahf
  ret

.align 8

__afl_setup:

  /* Do not retry setup if we had previous failures. */

  cmpb $0, __afl_setup_failure(%rip)
  jne __afl_return

  /* Check out if we have a global pointer on file. */

  movq  __afl_global_area_ptr@GOTPCREL(%rip), %rdx
  movq  (%rdx), %rdx
  testq %rdx, %rdx
  je    __afl_setup_first

  movq %rdx, __afl_area_ptr(%rip)
  jmp  __afl_store

__afl_setup_first:

  /* Save everything that is not yet saved and that may be touched by
     getenv() and several other libcalls we'll be relying on. */

  leaq -352(%rsp), %rsp

  movq %rax,   0(%rsp)
  movq %rcx,   8(%rsp)
  movq %rdi,  16(%rsp)
  movq %rsi,  32(%rsp)
  movq %r8,   40(%rsp)
  movq %r9,   48(%rsp)
  movq %r10,  56(%rsp)
  movq %r11,  64(%rsp)

  movq %xmm0,  96(%rsp)
  movq %xmm1,  112(%rsp)
  movq %xmm2,  128(%rsp)
  movq %xmm3,  144(%rsp)
  movq %xmm4,  160(%rsp)
  movq %xmm5,  176(%rsp)
  movq %xmm6,  192(%rsp)
  movq %xmm7,  208(%rsp)
  movq %xmm8,  224(%rsp)
  movq %xmm9,  240(%rsp)
  movq %xmm10, 256(%rsp)
  movq %xmm11, 272(%rsp)
  movq %xmm12, 288(%rsp)
  movq %xmm13, 304(%rsp)
  movq %xmm14, 320(%rsp)
  movq %xmm15, 336(%rsp)

  /* Map SHM, jumping to __afl_setup_abort if something goes wrong. */

  /* The 64-bit ABI requires 16-byte stack alignment. We'll keep the
     original stack ptr in the callee-saved r12. */

  pushq %r12
  movq  %rsp, %r12
  subq  $16, %rsp
  andq  $0xfffffffffffffff0, %rsp

  leaq .AFL_SHM_ENV(%rip), %rdi
call getenv@PLT

  testq %rax, %rax
  je    __afl_setup_abort

  movq  %rax, %rdi
call atoi@PLT

  xorq %rdx, %rdx   /* shmat flags    */
  xorq %rsi, %rsi   /* requested addr */
  movq %rax, %rdi   /* SHM ID         */
call shmat@PLT

  cmpq $-1, %rax
  je   __afl_setup_abort

  /* Store the address of the SHM region. */

  movq %rax, %rdx
  movq %rax, __afl_area_ptr(%rip)

  movq __afl_global_area_ptr@GOTPCREL(%rip), %rdx
  movq %rax, (%rdx)
  movq %rax, %rdx

__afl_forkserver:

  /* Enter the fork server mode to avoid the overhead of execve() calls. We
     push rdx (area ptr) twice to keep stack alignment neat. */

  pushq %rdx
  pushq %rdx

/*   Save the important information first  */
  movl $198, __fsrv_read
  movl $199, __fsrv_write
  /* Phone home and tell the parent that we're OK. (Note that signals with
     no SA_RESTART will mess it up). If this fails, assume that the fd is
     closed because we were execve()d from an instrumented binary, or because
     the parent doesn't want to use the fork server. */

  movq $4, %rdx               /* length    */
  leaq __afl_temp(%rip), %rsi /* data      */
  movq __fsrv_write, %rdi       /* file desc */
call write@PLT

  cmpq $4, %rax
  jne  __afl_fork_resume

__afl_fork_wait_loop:

  /* Wait for parent by reading from the pipe. Abort if read fails. */

  movq $4, %rdx               /* length    */
  leaq __afl_temp(%rip), %rsi /* data      */
  movq __fsrv_read, %rdi       /* file desc */
call read@PLT
  cmpq $4, %rax
  jne  __a