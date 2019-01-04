	.file	"harness.c"
	.text
.Ltext0:
	.globl	__asan_stack_malloc_2
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"3 32 4 1 a 96 8 4 line 160 8 3 len "
	.section	.rodata
	.align 32
.LC1:
	.string	"-s"
	.zero	61
	.align 32
.LC2:
	.string	"input: "
	.zero	56
	.align 32
.LC3:
	.string	"buff"
	.zero	59
	.align 32
.LC4:
	.string	"stack"
	.zero	58
	.align 32
.LC5:
	.string	"heap"
	.zero	59
	.align 32
.LC6:
	.string	"global"
	.zero	57
	.align 32
.LC7:
	.string	"commands: -s <buff|stack|heap|global>"
	.zero	58
	.align 32
.LC8:
	.string	"-i"
	.zero	61
	.align 32
.LC9:
	.string	"%d"
	.zero	61
	.align 32
.LC10:
	.string	"int_over"
	.zero	55
	.align 32
.LC11:
	.string	"value = %d\n"
	.zero	52
	.align 32
.LC12:
	.string	"int_under"
	.zero	54
	.align 32
.LC13:
	.string	"div_by_zero"
	.zero	52
	.align 32
.LC14:
	.string	"use_after_free"
	.zero	49
	.align 32
.LC15:
	.string	"out_of_bounds"
	.zero	50
	.align 32
.LC16:
	.string	"commands: -i <int_over|int_under|div_by_zero|use_after_free|out_of_bounds>"
	.zero	53
	.align 32
.LC17:
	.string	"commands: < -i .. | -s ..>"
	.zero	37
	.align 32
.LC18:
	.string	"mleak"
	.zero	58
	.align 32
.LC19:
	.string	"memory leak start"
	.zero	46
	.align 32
.LC20:
	.string	"did not crash"
	.zero	50
	.section	.text.unlikely,"ax",@progbits
.LCOLDB21:
	.section	.text.startup,"ax",@progbits
.LHOTB21:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.section	.text.startup
	.globl	main
	.type	main, @function
main:
.LASANPC71:
.LFB71:
	.file 1 "./harness.c"
	.loc 1 9 0
	.cfi_startproc
.LVL0:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000020a5, %rcx
movl $0x000020a5, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %r9
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	leaq	-272(%rbp), %r15
	pushq	%rbx
	movl	%edi, %r13d
	movq	%r15, %r12
	subq	$264, %rsp
	.cfi_offset 3, -56
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	testl	%eax, %eax
	jne	.L109

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

.LVL1:
.L1:
	.loc 1 9 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b775, %rcx
movl $0x0000b775, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%r15, %rbx
	movq	$1102416563, (%r15)
	movq	$.LC0, 8(%r15)
	shrq	$3, %rbx
	movq	$.LASANPC71, 16(%r15)
	leaq	224(%r15), %r14
	movl	$-235802127, 2147450880(%rbx)
	movl	$-185273340, 2147450884(%rbx)
	movl	$-218959118, 2147450888(%rbx)
	movl	$-185273344, 2147450892(%rbx)
	movl	$-218959118, 2147450896(%rbx)
	movl	$-185273344, 2147450900(%rbx)
	movl	$-202116109, 2147450904(%rbx)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	.loc 1 11 0
	cmpl	$3, %r13d
	je	.L110

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000899, %rcx
movl $0x00000899, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 72 0
	cmpl	$2, %r13d
	je	.L111

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00009fba, %rcx
movl $0x00009fba, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LBB49:
	.loc 1 85 0
	movl	$stdin, %edx
	.loc 1 79 0
	movq	%rsp, %r13
.LVL2:
	.loc 1 82 0
	movq	$0, -128(%r14)
	.loc 1 85 0
	shrq	$3, %rdx
	.loc 1 83 0
	movq	$0, -64(%r14)
	.loc 1 85 0
	cmpb	$0, 2147450880(%rdx)
	jne	.L112

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b14a, %rcx
movl $0x0000b14a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	stdin(%rip), %rdx
	leaq	160(%r15), %rsi
	leaq	96(%r15), %rdi
	call	getline
.LVL3:
	.loc 1 88 0
	movq	-64(%r14), %rcx
	testq	%rcx, %rcx
	je	.L113

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00001c7d, %rcx
movl $0x00001c7d, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 89 0 discriminator 2
	movq	-128(%r14), %r14
	.loc 1 88 0 discriminator 2
	addq	$15, %rcx
	andq	$-16, %rcx
	subq	%rcx, %rsp
.LVL4:
	.loc 1 89 0 discriminator 2
	testq	%r14, %r14
	je	.L114

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b60e, %rcx
movl $0x0000b60e, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LVL5:
.LBB50:
.LBB51:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/string3.h"
	.loc 2 110 0 discriminator 2
	movq	%r14, %rsi
	movq	%rsp, %rdi
	call	strcpy
.LVL6:
.LBE51:
.LBE50:
	.loc 1 90 0 discriminator 2
	movq	%r14, %rdi
	call	free
.LVL7:
	.loc 1 96 0 discriminator 2
	movq	%rsp, %rdi
	call	buffer_overflow
.LVL8:
	movq	%r13, %rsp
.LVL9:
.L33:
.LBE49:
.LBB52:
.LBB53:
	.file 3 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 3 104 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00004fed, %rcx
movl $0x00004fed, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC20, %edi
	call	puts
.LVL10:
.LBE53:
.LBE52:
	.loc 1 9 0
	cmpq	%r15, %r12
	jne	.L115

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00003b35, %rcx
movl $0x00003b35, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	$0, 2147450880(%rbx)
	movq	$0, 2147450888(%rbx)
	movq	$0, 2147450896(%rbx)
	movl	$0, 2147450904(%rbx)
.L3:
	.loc 1 129 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000a3f0, %rcx
movl $0x0000a3f0, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	xorl	%eax, %eax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L116

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b967, %rcx
movl $0x0000b967, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.LVL11:
.L111:
	.cfi_restore_state
.LBB54:
	.loc 1 73 0 discriminator 2

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00001668, %rcx
movl $0x00001668, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%r9, %rsi
	addq	$8, %rsi
	je	.L55

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ed4, %rcx
movl $0x00000ed4, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	testb	$7, %sil
	jne	.L55

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000031c5, %rcx
movl $0x000031c5, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rsi, %rdi
	shrq	$3, %rdi
	cmpb	$0, 2147450880(%rdi)
	jne	.L117

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000615c, %rcx
movl $0x0000615c, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	8(%r9), %rdi
	.loc 1 73 0 discriminator 2
	testq	%rdi, %rdi
	je	.L118

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00006a97, %rcx
movl $0x00006a97, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC18, %esi
	call	strcmp
.LVL12:
.LBE54:
	.loc 1 73 0 discriminator 2
	testl	%eax, %eax
	jne	.L33

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00003339, %rcx
movl $0x00003339, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LVL13:
.LBB55:
.LBB56:
.LBB57:
	.loc 3 104 0
	movl	$.LC19, %edi
	call	puts
.LVL14:
	jmp	.L33
.LVL15:
.L110:
.LBE57:
.LBE56:
.LBE55:
.LBB58:
.LBB59:
	.loc 1 12 0 discriminator 1

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000bc0, %rcx
movl $0x00000bc0, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	testq	%r9, %r9
	je	.L6

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ed4, %rcx
movl $0x00000ed4, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	testb	$7, %r9b
	jne	.L6

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000bc8d, %rcx
movl $0x0000bc8d, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leaq	8(%r9), %rdi
	movq	%rdi, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L119

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000554f, %rcx
movl $0x0000554f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	8(%r9), %r8
.LVL16:
	.loc 1 12 0 discriminator 1
	testq	%r8, %r8
	je	.L120

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000089fc, %rcx
movl $0x000089fc, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%r8, %r10
	movq	%r8, %rax
	shrq	$3, %r10
	andl	$7, %eax
	movzbl	2147450880(%r10), %r11d
	cmpb	%al, %r11b
	jg	.L10

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ed4, %rcx
movl $0x00000ed4, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	testb	%r11b, %r11b
	jne	.L121

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

.L10:
.LVL17:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000871, %rcx
movl $0x00000871, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	cmpb	$45, (%r8)
	je	.L122

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

.LVL18:
.L43:
.LBE59:
.LBE58:
.LBB64:
.LBB65:
	.loc 3 104 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00003339, %rcx
movl $0x00003339, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC17, %edi
	call	puts
.LVL19:
	jmp	.L33
.LVL20:
.L122:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00004694, %rcx
movl $0x00004694, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$1, %r13d
.LVL21:
	subq	$.LC1, %r13
	leaq	.LC1+1(%r13), %rdx
.LBE65:
.LBE64:
.LBB66:
.LBB60:
	.loc 1 12 0 discriminator 3
	cmpq	$3, %rdx
	ja	.L123

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

.L12:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00001668, %rcx
movl $0x00001668, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%r8, %rdi
	addq	$1, %rdi
	je	.L124

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00009a2c, %rcx
movl $0x00009a2c, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rdi, %rcx
	movq	%rdi, %r10
	shrq	$3, %rcx
	andl	$7, %r10d
	movzbl	2147450880(%rcx), %esi
	cmpb	%r10b, %sil
	jg	.L15

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ed4, %rcx
movl $0x00000ed4, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	testb	%sil, %sil
	jne	.L125

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

.L15:
.LVL22:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000871, %rcx
movl $0x00000871, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	cmpb	$115, 1(%r8)
	je	.L126

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

.LVL23:
.L62:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00004694, %rcx
movl $0x00004694, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$1, %ecx
	subq	$.LC8, %rcx
	leaq	.LC8+1(%rcx), %rsi
.LBE60:
.LBE66:
.LBB67:
.LBB68:
	.loc 1 43 0 discriminator 3
	cmpq	$3, %rsi
	ja	.L127

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

.L34:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000bc0, %rcx
movl $0x00000bc0, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	testq	%rdi, %rdi
	je	.L128

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000089fc, %rcx
movl $0x000089fc, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rdi, %r10
	movq	%rdi, %rax
	shrq	$3, %r10
	andl	$7, %eax
	movzbl	2147450880(%r10), %r11d
	cmpb	%al, %r11b
	jg	.L37

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ed4, %rcx
movl $0x00000ed4, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	testb	%r11b, %r11b
	jne	.L129

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

.L37:
.LVL24:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000b63, %rcx
movl $0x00000b63, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	cmpb	$105, 1(%r8)
	jne	.L43

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000167c, %rcx
movl $0x0000167c, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	addq	$.LC8+2, %rcx
	.loc 1 43 0 discriminator 5
	cmpq	$3, %rcx
	ja	.L130

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

.L39:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00001668, %rcx
movl $0x00001668, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%r8, %rdi
	addq	$2, %rdi
	je	.L131

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000893a, %rcx
movl $0x0000893a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rdi, %r13
	movq	%rdi, %rcx
	shrq	$3, %r13
	andl	$7, %ecx
	movzbl	2147450880(%r13), %edx
	cmpb	%cl, %dl
	jg	.L42

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ed4, %rcx
movl $0x00000ed4, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	testb	%dl, %dl
	jne	.L132

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

.L42:
.LBE68:
.LBE67:
	.loc 1 43 0 discriminator 5

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00001bae, %rcx
movl $0x00001bae, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	cmpb	$0, 2(%r8)
	movq	%r9, -280(%rbp)
.LVL25:
	jne	.L43

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000d2d2, %rcx
movl $0x0000d2d2, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LBB71:
	.loc 1 45 0
	leaq	-192(%r14), %rsi
	xorl	%eax, %eax
	movl	$.LC9, %edi
	call	__isoc99_scanf
.LVL26:
.LBB72:
	.loc 1 47 0
	movq	-280(%rbp), %r9
	movq	%r9, %rsi
	addq	$16, %rsi
	je	.L44

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ed4, %rcx
movl $0x00000ed4, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	testb	$7, %sil
	jne	.L44

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000031c5, %rcx
movl $0x000031c5, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rsi, %rdi
	shrq	$3, %rdi
	cmpb	$0, 2147450880(%rdi)
	jne	.L133

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00006170, %rcx
movl $0x00006170, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	16(%r9), %r13
	.loc 1 47 0
	testq	%r13, %r13
	je	.L134

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000942a, %rcx
movl $0x0000942a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 47 0 is_stmt 0 discriminator 2
	movl	$.LC10, %esi
	movq	%r13, %rdi
	call	strcmp
.LVL27:
.LBE72:
	.loc 1 47 0 is_stmt 1 discriminator 2
	testl	%eax, %eax
	jne	.L48

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00008158, %rcx
movl $0x00008158, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 48 0
	movl	-192(%r14), %edi
	call	integer_overflow
.LVL28:
.LBB73:
.LBB74:
	.loc 3 104 0
	movl	$.LC11, %esi
	movl	%eax, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.LVL29:
	jmp	.L33
.LVL30:
.L48:
.LBE74:
.LBE73:
.LBB75:
	.loc 1 50 0 discriminator 2

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000942a, %rcx
movl $0x0000942a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC12, %esi
	movq	%r13, %rdi
	call	strcmp
.LVL31:
.LBE75:
	.loc 1 50 0 discriminator 2
	testl	%eax, %eax
	jne	.L50

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00007981, %rcx
movl $0x00007981, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 51 0
	movl	-192(%r14), %edi
	call	integer_underflow
.LVL32:
	jmp	.L33
.LVL33:
.L126:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000167c, %rcx
movl $0x0000167c, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	addq	$.LC1+2, %r13
.LBE71:
.LBB84:
.LBB61:
	.loc 1 12 0 discriminator 5
	cmpq	$3, %r13
	ja	.L135

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

.L16:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00001668, %rcx
movl $0x00001668, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%r8, %r11
	addq	$2, %r11
	je	.L136

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00009b7c, %rcx
movl $0x00009b7c, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%r11, %rax
	movq	%r11, %rdx
	shrq	$3, %rax
	andl	$7, %edx
	movzbl	2147450880(%rax), %r13d
	cmpb	%dl, %r13b
	jg	.L19

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ed4, %rcx
movl $0x00000ed4, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	testb	%r13b, %r13b
	jne	.L137

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

.L19:
.LVL34:
.LBE61:
.LBE84:
	.loc 1 12 0 discriminator 5

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000b63, %rcx
movl $0x00000b63, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	cmpb	$0, 2(%r8)
	jne	.L62

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000093ed, %rcx
movl $0x000093ed, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LBB85:
.LBB86:
.LBB87:
	.loc 3 104 0 discriminator 12
	movl	$.LC2, %esi
	xorl	%eax, %eax
	movl	$1, %edi
	movq	%r9, -288(%rbp)
.LBE87:
.LBE86:
	.loc 1 12 0 discriminator 12
	movq	%rsp, -280(%rbp)
.LVL35:
.LBB89:
.LBB88:
	.loc 3 104 0 discriminator 12
	call	__printf_chk
.LVL36:
.LBE88:
.LBE89:
	.loc 1 19 0 discriminator 12
	movl	$stdin, %r8d
	.loc 1 16 0 discriminator 12
	movq	$0, -128(%r14)
	.loc 1 17 0 discriminator 12
	movq	$0, -64(%r14)
	.loc 1 19 0 discriminator 12
	shrq	$3, %r8
	movq	-288(%rbp), %rsi
	cmpb	$0, 2147450880(%r8)
	jne	.L138

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b031, %rcx
movl $0x0000b031, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	stdin(%rip), %rdx
	movq	%rsi, -288(%rbp)
	leaq	-128(%r14), %rdi
	leaq	-64(%r14), %rsi
	call	getline
.LVL37:
	.loc 1 22 0 discriminator 12
	movq	-64(%r14), %r10
	movq	-288(%rbp), %r11
	testq	%r10, %r10
	je	.L139

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000064b3, %rcx
movl $0x000064b3, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 23 0 discriminator 2
	movq	-128(%r14), %r14
	.loc 1 22 0 discriminator 2
	addq	$15, %r10
	andq	$-16, %r10
	subq	%r10, %rsp
	.loc 1 23 0 discriminator 2
	testq	%r14, %r14
	.loc 1 22 0 discriminator 2
	movq	%rsp, -296(%rbp)
.LVL38:
	.loc 1 23 0 discriminator 2
	je	.L140

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000f6c2, %rcx
movl $0x0000f6c2, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LBB90:
.LBB91:
	.loc 2 110 0 discriminator 2
	movq	%r14, %rsi
	movq	%rsp, %rdi
	movq	%r11, -288(%rbp)
.LVL39:
	call	strcpy
.LVL40:
.LBE91:
.LBE90:
	.loc 1 24 0 discriminator 2
	movq	%r14, %rdi
	call	free
.LVL41:
.LBB92:
	.loc 1 26 0 discriminator 2
	movq	-288(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$16, %rsi
	je	.L24

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ed4, %rcx
movl $0x00000ed4, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	testb	$7, %sil
	jne	.L24

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000031c5, %rcx
movl $0x000031c5, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rsi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L141

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00006c9d, %rcx
movl $0x00006c9d, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	16(%rdx), %r13
	.loc 1 26 0 discriminator 2
	testq	%r13, %r13
	je	.L142

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000942a, %rcx
movl $0x0000942a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC3, %esi
	movq	%r13, %rdi
	call	strcmp
.LVL42:
.LBE92:
	.loc 1 26 0 discriminator 2
	testl	%eax, %eax
	jne	.L28

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00007368, %rcx
movl $0x00007368, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 27 0
	movq	%rsp, %rdi
	call	buffer_overflow
.LVL43:
.L29:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000592f, %rcx
movl $0x0000592f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	-280(%rbp), %rsp
.LVL44:
.LBE85:
	jmp	.L33
.LVL45:
.L28:
.LBB100:
.LBB93:
	.loc 1 29 0 discriminator 2

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000942a, %rcx
movl $0x0000942a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC4, %esi
	movq	%r13, %rdi
	call	strcmp
.LVL46:
.LBE93:
	.loc 1 29 0 discriminator 2
	testl	%eax, %eax
	jne	.L30

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00004b3f, %rcx
movl $0x00004b3f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 30 0
	movq	-296(%rbp), %rdi
	call	stack_overflow
.LVL47:
	jmp	.L29
.L30:
.LVL48:
.LBB94:
	.loc 1 32 0 discriminator 2

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000942a, %rcx
movl $0x0000942a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC5, %esi
	movq	%r13, %rdi
	call	strcmp
.LVL49:
.LBE94:
	.loc 1 32 0 discriminator 2
	testl	%eax, %eax
	jne	.L31

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00003902, %rcx
movl $0x00003902, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 33 0
	movq	-296(%rbp), %rdi
	call	heap_overflow
.LVL50:
	jmp	.L29
.LVL51:
.L50:
.LBE100:
.LBB101:
.LBB76:
	.loc 1 53 0 discriminator 2

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000942a, %rcx
movl $0x0000942a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC13, %esi
	movq	%r13, %rdi
	call	strcmp
.LVL52:
.LBE76:
	.loc 1 53 0 discriminator 2
	testl	%eax, %eax
	jne	.L51

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000067da, %rcx
movl $0x000067da, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LVL53:
.LBB77:
	.loc 1 56 0
	movl	-192(%r14), %edi
	call	division_by_zero
.LVL54:
.LBE77:
	jmp	.L33
.LVL55:
.L31:
.LBE101:
.LBB102:
.LBB95:
	.loc 1 35 0 discriminator 2

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000942a, %rcx
movl $0x0000942a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC6, %esi
	movq	%r13, %rdi
	call	strcmp
.LVL56:
.LBE95:
	.loc 1 35 0 discriminator 2
	testl	%eax, %eax
	jne	.L32

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000de8d, %rcx
movl $0x0000de8d, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 36 0
	movq	-296(%rbp), %rdi
	call	global_buffer_overflow
.LVL57:
	jmp	.L29
.LVL58:
.L51:
.LBE102:
.LBB103:
.LBB78:
	.loc 1 58 0 discriminator 2

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000942a, %rcx
movl $0x0000942a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC14, %esi
	movq	%r13, %rdi
	call	strcmp
.LVL59:
.LBE78:
	.loc 1 58 0 discriminator 2
	testl	%eax, %eax
	jne	.L52

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00003ee3, %rcx
movl $0x00003ee3, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 59 0
	movl	-192(%r14), %edi
	call	use_after_free
.LVL60:
	jmp	.L33
.LVL61:
.L32:
.LBE103:
.LBB104:
.LBB96:
.LBB97:
	.loc 3 104 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00003339, %rcx
movl $0x00003339, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC7, %edi
	call	puts
.LVL62:
	jmp	.L29
.LVL63:
.L52:
.LBE97:
.LBE96:
.LBE104:
.LBB105:
.LBB79:
	.loc 1 61 0 discriminator 2

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000942a, %rcx
movl $0x0000942a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC15, %esi
	movq	%r13, %rdi
	call	strcmp
.LVL64:
.LBE79:
	.loc 1 61 0 discriminator 2
	testl	%eax, %eax
	jne	.L53

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00003254, %rcx
movl $0x00003254, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 62 0
	movl	-192(%r14), %edi
	call	out_of_bounds
.LVL65:
	jmp	.L33
.L53:
.LVL66:
.LBB80:
.LBB81:
	.loc 3 104 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00003339, %rcx
movl $0x00003339, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC16, %edi
	call	puts
.LVL67:
	jmp	.L33
.LVL68:
.L116:
.LBE81:
.LBE80:
.LBE105:
	.loc 1 129 0

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
.LVL69:
.L115:
	.loc 1 9 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000c930, %rcx
movl $0x0000c930, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movabsq	$-723401728380766731, %r12
	movq	$1172321806, (%r15)
	movl	$-168430091, 2147450904(%rbx)
	movq	%r12, 2147450880(%rbx)
	movq	%r12, 2147450888(%rbx)
	movq	%r12, 2147450896(%rbx)
	jmp	.L3
.LVL70:
.L109:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000bce8, %rcx
movl $0x0000bce8, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rsi, -280(%rbp)
	movl	$224, %edi
.LVL71:
	movq	%r15, %rsi
.LVL72:
	call	__asan_stack_malloc_2
.LVL73:
	movq	-280(%rbp), %r9
	movq	%rax, %r15
	jmp	.L1
.LVL74:
.L113:
.LBB106:
	.loc 1 88 0 discriminator 1

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000076b4, %rcx
movl $0x000076b4, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__asan_handle_no_return
.LVL75:
	xorl	%esi, %esi
	movl	$.Lubsan_data2, %edi
	call	__ubsan_handle_vla_bound_not_positive_abort
.LVL76:
.L114:
	.loc 1 89 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000a149, %rcx
movl $0x0000a149, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__asan_handle_no_return
.LVL77:
	movl	$.Lubsan_data40, %edi
	call	__ubsan_handle_nonnull_arg_abort
.LVL78:
.L118:
.LBE106:
.LBB107:
	.loc 1 73 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000a149, %rcx
movl $0x0000a149, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__asan_handle_no_return
.LVL79:
	movl	$.Lubsan_data36, %edi
	call	__ubsan_handle_nonnull_arg_abort
.LVL80:
.L141:
.LBE107:
.LBB108:
.LBB98:
	.loc 1 26 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000094cc, %rcx
movl $0x000094cc, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rsi, %rdi
	call	__asan_report_load8
.LVL81:
.L24:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000706d, %rcx
movl $0x0000706d, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.Lubsan_data51, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL82:
.L55:
.LBE98:
.LBE108:
.LBB109:
	.loc 1 73 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000706d, %rcx
movl $0x0000706d, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.Lubsan_data59, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL83:
.L117:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000094cc, %rcx
movl $0x000094cc, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rsi, %rdi
	call	__asan_report_load8
.LVL84:
.L124:
.LBE109:
.LBB110:
.LBB62:
	.loc 1 12 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b93b, %rcx
movl $0x0000b93b, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	xorl	%esi, %esi
	movl	$.Lubsan_data47, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL85:
.L123:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000869, %rcx
movl $0x00000869, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	addq	$.LC1+1, %rdx
	jc	.L12

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b93c, %rcx
movl $0x0000b93c, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC1+1, %esi
	movl	$.Lubsan_data46, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL86:
.L121:
	.loc 1 12 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000940f, %rcx
movl $0x0000940f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%r8, %rdi
	call	__asan_report_load1
.LVL87:
.L125:
	.loc 1 12 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00006b64, %rcx
movl $0x00006b64, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__asan_report_load1
.LVL88:
.L120:
	.loc 1 12 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b93b, %rcx
movl $0x0000b93b, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	xorl	%esi, %esi
	movl	$.Lubsan_data44, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL89:
.L119:
	.loc 1 12 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00006c05, %rcx
movl $0x00006c05, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__asan_report_load8
.LVL90:
.L6:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b950, %rcx
movl $0x0000b950, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%r9, %rsi
	movl	$.Lubsan_data42, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL91:
.L112:
.LBE62:
.LBE110:
.LBB111:
	.loc 1 85 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000094b8, %rcx
movl $0x000094b8, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$stdin, %edi
	call	__asan_report_load8
.LVL92:
.L142:
.LBE111:
.LBB112:
.LBB99:
	.loc 1 26 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000a149, %rcx
movl $0x0000a149, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__asan_handle_no_return
.LVL93:
	movl	$.Lubsan_data11, %edi
	call	__ubsan_handle_nonnull_arg_abort
.LVL94:
.L129:
.LBE99:
.LBE112:
.LBB113:
.LBB69:
	.loc 1 43 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00006b64, %rcx
movl $0x00006b64, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__asan_report_load1
.LVL95:
.L128:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b93b, %rcx
movl $0x0000b93b, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	xorl	%esi, %esi
	movl	$.Lubsan_data54, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL96:
.L127:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000869, %rcx
movl $0x00000869, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	addq	$.LC8+1, %rsi
	jc	.L34

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b93c, %rcx
movl $0x0000b93c, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC8+1, %esi
	movl	$.Lubsan_data53, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL97:
.L44:
.LBE69:
.LBE113:
.LBB114:
.LBB82:
	.loc 1 47 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000706d, %rcx
movl $0x0000706d, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.Lubsan_data58, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL98:
.L131:
.LBE82:
.LBE114:
.LBB115:
.LBB70:
	.loc 1 43 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b93b, %rcx
movl $0x0000b93b, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	xorl	%esi, %esi
	movl	$.Lubsan_data57, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL99:
.L130:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000869, %rcx
movl $0x00000869, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	addq	$.LC8+2, %rcx
	jc	.L39

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b93c, %rcx
movl $0x0000b93c, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC8+2, %esi
	movl	$.Lubsan_data56, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL100:
.L132:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00006b64, %rcx
movl $0x00006b64, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__asan_report_load1
.LVL101:
.L140:
.LBE70:
.LBE115:
.LBB116:
	.loc 1 23 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000a149, %rcx
movl $0x0000a149, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__asan_handle_no_return
.LVL102:
	movl	$.Lubsan_data10, %edi
	call	__ubsan_handle_nonnull_arg_abort
.LVL103:
.L139:
	.loc 1 22 0 discriminator 1

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000076b4, %rcx
movl $0x000076b4, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__asan_handle_no_return
.LVL104:
	xorl	%esi, %esi
	movl	$.Lubsan_data1, %edi
	call	__ubsan_handle_vla_bound_not_positive_abort
.LVL105:
.L138:
	.loc 1 19 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000094b8, %rcx
movl $0x000094b8, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$stdin, %edi
	call	__asan_report_load8
.LVL106:
.L136:
.LBE116:
.LBB117:
.LBB63:
	.loc 1 12 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b93b, %rcx
movl $0x0000b93b, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	xorl	%esi, %esi
	movl	$.Lubsan_data50, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL107:
.L135:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000869, %rcx
movl $0x00000869, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	addq	$.LC1+2, %r13
	jc	.L16

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b93c, %rcx
movl $0x0000b93c, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC1+2, %esi
	movl	$.Lubsan_data49, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL108:
.L137:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000940f, %rcx
movl $0x0000940f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%r11, %rdi
	call	__asan_report_load1
.LVL109:
.L134:
.LBE63:
.LBE117:
.LBB118:
.LBB83:
	.loc 1 47 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000a149, %rcx
movl $0x0000a149, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__asan_handle_no_return
.LVL110:
	movl	$.Lubsan_data23, %edi
	call	__ubsan_handle_nonnull_arg_abort
.LVL111:
.L133:
	.loc 1 47 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000094cc, %rcx
movl $0x000094cc, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rsi, %rdi
	call	__asan_report_load8
.LVL112:
.LBE83:
.LBE118:
	.cfi_endproc
.LFE71:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE21:
	.section	.text.startup
.LHOTE21:
	.section	.rodata
	.align 32
.LC22:
	.string	"./harness.c"
	.zero	52
	.data
	.align 32
	.type	.Lubsan_data59, @object
	.size	.Lubsan_data59, 40
.Lubsan_data59:
	.quad	.LC22
	.long	73
	.long	45
	.quad	.Lubsan_type1
	.quad	8
	.byte	0
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_data58, @object
	.size	.Lubsan_data58, 40
.Lubsan_data58:
	.quad	.LC22
	.long	47
	.long	46
	.quad	.Lubsan_type1
	.quad	8
	.byte	0
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_data57, @object
	.size	.Lubsan_data57, 40
.Lubsan_data57:
	.quad	.LC22
	.long	43
	.long	22
	.quad	.Lubsan_type2
	.quad	0
	.byte	0
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_data56, @object
	.size	.Lubsan_data56, 40
.Lubsan_data56:
	.quad	.LC22
	.long	43
	.long	12
	.quad	.Lubsan_type3
	.quad	0
	.byte	0
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_data54, @object
	.size	.Lubsan_data54, 40
.Lubsan_data54:
	.quad	.LC22
	.long	43
	.long	22
	.quad	.Lubsan_type2
	.quad	0
	.byte	0
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_data53, @object
	.size	.Lubsan_data53, 40
.Lubsan_data53:
	.quad	.LC22
	.long	43
	.long	12
	.quad	.Lubsan_type3
	.quad	0
	.byte	0
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_data51, @object
	.size	.Lubsan_data51, 40
.Lubsan_data51:
	.quad	.LC22
	.long	26
	.long	46
	.quad	.Lubsan_type1
	.quad	8
	.byte	0
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_data50, @object
	.size	.Lubsan_data50, 40
.Lubsan_data50:
	.quad	.LC22
	.long	12
	.long	17
	.quad	.Lubsan_type2
	.quad	0
	.byte	0
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_data49, @object
	.size	.Lubsan_data49, 40
.Lubsan_data49:
	.quad	.LC22
	.long	12
	.long	7
	.quad	.Lubsan_type3
	.quad	0
	.byte	0
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_data47, @object
	.size	.Lubsan_data47, 40
.Lubsan_data47:
	.quad	.LC22
	.long	12
	.long	17
	.quad	.Lubsan_type2
	.quad	0
	.byte	0
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_data46, @object
	.size	.Lubsan_data46, 40
.Lubsan_data46:
	.quad	.LC22
	.long	12
	.long	7
	.quad	.Lubsan_type3
	.quad	0
	.byte	0
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_type3, @object
	.size	.Lubsan_type3, 11
.Lubsan_type3:
	.value	-1
	.value	0
	.string	"'char'"
	.zero	53
	.align 32
	.type	.Lubsan_data44, @object
	.size	.Lubsan_data44, 40
.Lubsan_data44:
	.quad	.LC22
	.long	12
	.long	17
	.quad	.Lubsan_type2
	.quad	0
	.byte	0
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_type2, @object
	.size	.Lubsan_type2, 26
.Lubsan_type2:
	.value	-1
	.value	0
	.string	"'const unsigned char'"
	.zero	38
	.align 32
	.type	.Lubsan_data42, @object
	.size	.Lubsan_data42, 40
.Lubsan_data42:
	.quad	.LC22
	.long	12
	.long	51
	.quad	.Lubsan_type1
	.quad	8
	.byte	0
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_type1, @object
	.size	.Lubsan_type1, 13
.Lubsan_type1:
	.value	-1
	.value	0
	.string	"'char *'"
	.zero	51
	.align 32
	.type	.Lubsan_data40, @object
	.size	.Lubsan_data40, 40
.Lubsan_data40:
	.quad	.LC22
	.long	89
	.long	3
	.quad	0
	.long	0
	.long	0
	.long	2
	.zero	4
	.zero	56
	.align 32
	.type	.Lubsan_data36, @object
	.size	.Lubsan_data36, 40
.Lubsan_data36:
	.quad	.LC22
	.long	73
	.long	7
	.quad	0
	.long	0
	.long	0
	.long	1
	.zero	4
	.zero	56
	.align 32
	.type	.Lubsan_data23, @object
	.size	.Lubsan_data23, 40
.Lubsan_data23:
	.quad	.LC22
	.long	47
	.long	8
	.quad	0
	.long	0
	.long	0
	.long	1
	.zero	4
	.zero	56
	.align 32
	.type	.Lubsan_data11, @object
	.size	.Lubsan_data11, 40
.Lubsan_data11:
	.quad	.LC22
	.long	26
	.long	8
	.quad	0
	.long	0
	.long	0
	.long	1
	.zero	4
	.zero	56
	.align 32
	.type	.Lubsan_data10, @object
	.size	.Lubsan_data10, 40
.Lubsan_data10:
	.quad	.LC22
	.long	23
	.long	4
	.quad	0
	.long	0
	.long	0
	.long	2
	.zero	4
	.zero	56
	.align 32
	.type	.Lubsan_data2, @object
	.size	.Lubsan_data2, 24
.Lubsan_data2:
	.quad	.LC22
	.long	88
	.long	8
	.quad	.Lubsan_type0
	.zero	40
	.align 32
	.type	.Lubsan_data1, @object
	.size	.Lubsan_data1, 24
.Lubsan_data1:
	.quad	.LC22
	.long	22
	.long	9
	.quad	.Lubsan_type0
	.zero	40
	.align 32
	.type	.Lubsan_type0, @object
	.size	.Lubsan_type0, 24
.Lubsan_type0:
	.value	0
	.value	12
	.string	"'long unsigned int'"
	.zero	40
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC23:
	.string	"*.Lubsan_data59"
.LC24:
	.string	"*.Lubsan_data58"
.LC25:
	.string	"*.Lubsan_data57"
.LC26:
	.string	"*.Lubsan_data56"
.LC27:
	.string	"*.Lubsan_data54"
.LC28:
	.string	"*.Lubsan_data53"
.LC29:
	.string	"*.Lubsan_data51"
.LC30:
	.string	"*.Lubsan_data50"
.LC31:
	.string	"*.Lubsan_data49"
.LC32:
	.string	"*.Lubsan_data47"
.LC33:
	.string	"*.Lubsan_data46"
.LC34:
	.string	"*.Lubsan_type3"
.LC35:
	.string	"*.Lubsan_data44"
.LC36:
	.string	"*.Lubsan_type2"
.LC37:
	.string	"*.Lubsan_data42"
.LC38:
	.string	"*.Lubsan_type1"
.LC39:
	.string	"*.Lubsan_data40"
.LC40:
	.string	"*.Lubsan_data36"
.LC41:
	.string	"*.Lubsan_data23"
.LC42:
	.string	"*.Lubsan_data11"
.LC43:
	.string	"*.Lubsan_data10"
.LC44:
	.string	"*.Lubsan_data2"
.LC45:
	.string	"*.Lubsan_data1"
.LC46:
	.string	"*.Lubsan_type0"
.LC47:
	.string	"*.LC15"
.LC48:
	.string	"*.LC22"
.LC49:
	.string	"*.LC17"
.LC50:
	.string	"*.LC19"
.LC51:
	.string	"*.LC12"
.LC52:
	.string	"*.LC8"
.LC53:
	.string	"*.LC14"
.LC54:
	.string	"*.LC4"
.LC55:
	.string	"*.LC2"
.LC56:
	.string	"*.LC16"
.LC57:
	.string	"*.LC20"
.LC58:
	.string	"*.LC3"
.LC59:
	.string	"*.LC10"
.LC60:
	.string	"*.LC1"
.LC61:
	.string	"*.LC18"
.LC62:
	.string	"*.LC5"
.LC63:
	.string	"*.LC7"
.LC64:
	.string	"*.LC9"
.LC65:
	.string	"*.LC13"
.LC66:
	.string	"*.LC11"
.LC67:
	.string	"*.LC6"
	.data
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 2520
.LASAN0:
	.quad	.Lubsan_data59
	.quad	40
	.quad	96
	.quad	.LC23
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data58
	.quad	40
	.quad	96
	.quad	.LC24
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data57
	.quad	40
	.quad	96
	.quad	.LC25
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data56
	.quad	40
	.quad	96
	.quad	.LC26
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data54
	.quad	40
	.quad	96
	.quad	.LC27
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data53
	.quad	40
	.quad	96
	.quad	.LC28
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data51
	.quad	40
	.quad	96
	.quad	.LC29
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data50
	.quad	40
	.quad	96
	.quad	.LC30
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data49
	.quad	40
	.quad	96
	.quad	.LC31
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data47
	.quad	40
	.quad	96
	.quad	.LC32
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data46
	.quad	40
	.quad	96
	.quad	.LC33
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_type3
	.quad	11
	.quad	64
	.quad	.LC34
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data44
	.quad	40
	.quad	96
	.quad	.LC35
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_type2
	.quad	26
	.quad	64
	.quad	.LC36
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data42
	.quad	40
	.quad	96
	.quad	.LC37
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_type1
	.quad	13
	.quad	64
	.quad	.LC38
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data40
	.quad	40
	.quad	96
	.quad	.LC39
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data36
	.quad	40
	.quad	96
	.quad	.LC40
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data23
	.quad	40
	.quad	96
	.quad	.LC41
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data11
	.quad	40
	.quad	96
	.quad	.LC42
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data10
	.quad	40
	.quad	96
	.quad	.LC43
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data2
	.quad	24
	.quad	64
	.quad	.LC44
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_data1
	.quad	24
	.quad	64
	.quad	.LC45
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.Lubsan_type0
	.quad	24
	.quad	64
	.quad	.LC46
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC15
	.quad	14
	.quad	64
	.quad	.LC47
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC22
	.quad	12
	.quad	64
	.quad	.LC48
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC17
	.quad	27
	.quad	64
	.quad	.LC49
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC19
	.quad	18
	.quad	64
	.quad	.LC50
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC12
	.quad	10
	.quad	64
	.quad	.LC51
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC8
	.quad	3
	.quad	64
	.quad	.LC52
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC14
	.quad	15
	.quad	64
	.quad	.LC53
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC4
	.quad	6
	.quad	64
	.quad	.LC54
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC2
	.quad	8
	.quad	64
	.quad	.LC55
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC16
	.quad	75
	.quad	128
	.quad	.LC56
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC20
	.quad	14
	.quad	64
	.quad	.LC57
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC3
	.quad	5
	.quad	64
	.quad	.LC58
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC10
	.quad	9
	.quad	64
	.quad	.LC59
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC1
	.quad	3
	.quad	64
	.quad	.LC60
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC18
	.quad	6
	.quad	64
	.quad	.LC61
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC5
	.quad	5
	.quad	64
	.quad	.LC62
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC7
	.quad	38
	.quad	96
	.quad	.LC63
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC9
	.quad	3
	.quad	64
	.quad	.LC64
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC13
	.quad	12
	.quad	64
	.quad	.LC65
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC11
	.quad	12
	.quad	64
	.quad	.LC66
	.quad	.LC22
	.quad	0
	.quad	0
	.quad	.LC6
	.quad	7
	.quad	64
	.quad	.LC67
	.quad	.LC22
	.quad	0
	.quad	0
	.section	.text.unlikely
.LCOLDB68:
	.section	.text.exit,"ax",@progbits
.LHOTB68:
	.p2align 4,,15
	.type	_GLOBAL__sub_D_00099_0_main, @function
_GLOBAL__sub_D_00099_0_main:
.LFB72:
	.loc 1 129 0
	.cfi_startproc
	.loc 1 129 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000120a, %rcx
movl $0x0000120a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$45, %esi
	movl	$.LASAN0, %edi
	jmp	__asan_unregister_globals
.LVL113:
	.cfi_endproc
.LFE72:
	.size	_GLOBAL__sub_D_00099_0_main, .-_GLOBAL__sub_D_00099_0_main
	.section	.text.unlikely
.LCOLDE68:
	.section	.text.exit
.LHOTE68:
	.section	.fini_array.00099,"aw"
	.align 8
	.quad	_GLOBAL__sub_D_00099_0_main
	.section	.text.unlikely
.LCOLDB69:
	.section	.text.startup
.LHOTB69:
	.p2align 4,,15
	.type	_GLOBAL__sub_I_00099_1_main, @function
_GLOBAL__sub_I_00099_1_main:
.LFB73:
	.loc 1 129 0
	.cfi_startproc

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000e8d6, %rcx
movl $0x0000e8d6, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 129 0
	call	__asan_init_v4
.LVL114:
	movl	$45, %esi
	movl	$.LASAN0, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__asan_register_globals
.LVL115:
	.cfi_endproc
.LFE73:
	.size	_GLOBAL__sub_I_00099_1_main, .-_GLOBAL__sub_I_00099_1_main
	.section	.text.unlikely
.LCOLDE69:
	.section	.text.startup
.LHOTE69:
	.section	.init_array.00099,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_00099_1_main
	.text
.Letext0:
	.section	.text.unlikely
.Letext_cold0:
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 6 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.file 7 "/usr/include/libio.h"
	.file 8 "/usr/include/stdio.h"
	.file 9 "/usr/include/stdlib.h"
	.file 10 "./vul.h"
	.file 11 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1214
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF106
	.byte	0xc
	.long	.LASF107
	.long	.LASF108
	.long	.Ldebug_ranges0+0x2c0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x4
	.byte	0xd8
	.long	0x34
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
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
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x5
	.byte	0x83
	.long	0x65
	.uleb128 0x2
	.long	.LASF9
	.byte	0x5
	.byte	0x84
	.long	0x65
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x2
	.long	.LASF11
	.byte	0x5
	.byte	0xac
	.long	0x65
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF13
	.uleb128 0x2
	.long	.LASF14
	.byte	0x6
	.byte	0x6d
	.long	0x8b
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x6
	.byte	0x8
	.long	0xc2
	.uleb128 0x7
	.long	0x9c
	.uleb128 0x8
	.long	.LASF45
	.byte	0xd8
	.byte	0x7
	.byte	0xf1
	.long	0x244
	.uleb128 0x9
	.long	.LASF16
	.byte	0x7
	.byte	0xf2
	.long	0x3b
	.byte	0
	.uleb128 0x9
	.long	.LASF17
	.byte	0x7
	.byte	0xf7
	.long	0x96
	.byte	0x8
	.uleb128 0x9
	.long	.LASF18
	.byte	0x7
	.byte	0xf8
	.long	0x96
	.byte	0x10
	.uleb128 0x9
	.long	.LASF19
	.byte	0x7
	.byte	0xf9
	.long	0x96
	.byte	0x18
	.uleb128 0x9
	.long	.LASF20
	.byte	0x7
	.byte	0xfa
	.long	0x96
	.byte	0x20
	.uleb128 0x9
	.long	.LASF21
	.byte	0x7
	.byte	0xfb
	.long	0x96
	.byte	0x28
	.uleb128 0x9
	.long	.LASF22
	.byte	0x7
	.byte	0xfc
	.long	0x96
	.byte	0x30
	.uleb128 0x9
	.long	.LASF23
	.byte	0x7
	.byte	0xfd
	.long	0x96
	.byte	0x38
	.uleb128 0x9
	.long	.LASF24
	.byte	0x7
	.byte	0xfe
	.long	0x96
	.byte	0x40
	.uleb128 0xa
	.long	.LASF25
	.byte	0x7
	.value	0x100
	.long	0x96
	.byte	0x48
	.uleb128 0xa
	.long	.LASF26
	.byte	0x7
	.value	0x101
	.long	0x96
	.byte	0x50
	.uleb128 0xa
	.long	.LASF27
	.byte	0x7
	.value	0x102
	.long	0x96
	.byte	0x58
	.uleb128 0xa
	.long	.LASF28
	.byte	0x7
	.value	0x104
	.long	0x27c
	.byte	0x60
	.uleb128 0xa
	.long	.LASF29
	.byte	0x7
	.value	0x106
	.long	0x282
	.byte	0x68
	.uleb128 0xa
	.long	.LASF30
	.byte	0x7
	.value	0x108
	.long	0x3b
	.byte	0x70
	.uleb128 0xa
	.long	.LASF31
	.byte	0x7
	.value	0x10c
	.long	0x3b
	.byte	0x74
	.uleb128 0xa
	.long	.LASF32
	.byte	0x7
	.value	0x10e
	.long	0x6c
	.byte	0x78
	.uleb128 0xa
	.long	.LASF33
	.byte	0x7
	.value	0x112
	.long	0x50
	.byte	0x80
	.uleb128 0xa
	.long	.LASF34
	.byte	0x7
	.value	0x113
	.long	0x57
	.byte	0x82
	.uleb128 0xa
	.long	.LASF35
	.byte	0x7
	.value	0x114
	.long	0x288
	.byte	0x83
	.uleb128 0xa
	.long	.LASF36
	.byte	0x7
	.value	0x118
	.long	0x298
	.byte	0x88
	.uleb128 0xa
	.long	.LASF37
	.byte	0x7
	.value	0x121
	.long	0x77
	.byte	0x90
	.uleb128 0xa
	.long	.LASF38
	.byte	0x7
	.value	0x129
	.long	0x89
	.byte	0x98
	.uleb128 0xa
	.long	.LASF39
	.byte	0x7
	.value	0x12a
	.long	0x89
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF40
	.byte	0x7
	.value	0x12b
	.long	0x89
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF41
	.byte	0x7
	.value	0x12c
	.long	0x89
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF42
	.byte	0x7
	.value	0x12e
	.long	0x29
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF43
	.byte	0x7
	.value	0x12f
	.long	0x3b
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF44
	.byte	0x7
	.value	0x131
	.long	0x29e
	.byte	0xc4
	.byte	0
	.uleb128 0xb
	.long	.LASF109
	.byte	0x7
	.byte	0x96
	.uleb128 0x8
	.long	.LASF46
	.byte	0x18
	.byte	0x7
	.byte	0x9c
	.long	0x27c
	.uleb128 0x9
	.long	.LASF47
	.byte	0x7
	.byte	0x9d
	.long	0x27c
	.byte	0
	.uleb128 0x9
	.long	.LASF48
	.byte	0x7
	.byte	0x9e
	.long	0x282
	.byte	0x8
	.uleb128 0x9
	.long	.LASF49
	.byte	0x7
	.byte	0xa2
	.long	0x3b
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x24b
	.uleb128 0x6
	.byte	0x8
	.long	0xc7
	.uleb128 0xc
	.long	0x9c
	.long	0x298
	.uleb128 0xd
	.long	0x82
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x244
	.uleb128 0xc
	.long	0x9c
	.long	0x2ae
	.uleb128 0xd
	.long	0x82
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF50
	.byte	0x3
	.byte	0x66
	.long	0x3b
	.byte	0x3
	.long	0x2cb
	.uleb128 0xf
	.long	.LASF52
	.byte	0x3
	.byte	0x66
	.long	0x2cb
	.uleb128 0x10
	.byte	0
	.uleb128 0x11
	.long	0xbc
	.uleb128 0xe
	.long	.LASF51
	.byte	0x2
	.byte	0x6c
	.long	0x96
	.byte	0x3
	.long	0x2f7
	.uleb128 0xf
	.long	.LASF53
	.byte	0x2
	.byte	0x6c
	.long	0x2f7
	.uleb128 0xf
	.long	.LASF54
	.byte	0x2
	.byte	0x6c
	.long	0x2cb
	.byte	0
	.uleb128 0x11
	.long	0x96
	.uleb128 0x12
	.long	.LASF110
	.byte	0x1
	.byte	0x9
	.long	0x3b
	.quad	.LFB71
	.quad	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.long	0xf33
	.uleb128 0x13
	.long	.LASF55
	.byte	0x1
	.byte	0x9
	.long	0x3b
	.long	.LLST0
	.uleb128 0x13
	.long	.LASF56
	.byte	0x1
	.byte	0x9
	.long	0xf33
	.long	.LLST1
	.uleb128 0x14
	.long	.Ldebug_ranges0+0
	.long	0x480
	.uleb128 0x15
	.long	.LASF57
	.byte	0x1
	.byte	0x52
	.long	0x96
	.uleb128 0x16
	.string	"len"
	.byte	0x1
	.byte	0x53
	.long	0x29
	.uleb128 0x15
	.long	.LASF58
	.byte	0x1
	.byte	0x54
	.long	0xaa
	.uleb128 0x17
	.long	.LASF60
	.byte	0x1
	.byte	0x58
	.long	0xf39
	.long	.LLST2
	.uleb128 0x16
	.string	"a"
	.byte	0x1
	.byte	0x63
	.long	0x3b
	.uleb128 0x18
	.long	0x2d0
	.quad	.LBB50
	.quad	.LBE50-.LBB50
	.byte	0x1
	.byte	0x59
	.long	0x3c5
	.uleb128 0x19
	.long	0x2eb
	.long	.LLST3
	.uleb128 0x19
	.long	0x2e0
	.long	.LLST4
	.uleb128 0x1a
	.quad	.LVL6
	.long	0xfff
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL3
	.long	0x100e
	.long	0x3e5
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x7f
	.sleb128 96
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x7f
	.sleb128 160
	.byte	0
	.uleb128 0x1c
	.quad	.LVL7
	.long	0x101a
	.long	0x3fd
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL8
	.long	0x1026
	.long	0x415
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.quad	.LVL75
	.long	0x1031
	.uleb128 0x1c
	.quad	.LVL76
	.long	0x1040
	.long	0x446
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data2
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1d
	.quad	.LVL77
	.long	0x1031
	.uleb128 0x1c
	.quad	.LVL78
	.long	0x104f
	.long	0x472
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data40
	.byte	0
	.uleb128 0x1d
	.quad	.LVL92
	.long	0x105e
	.byte	0
	.uleb128 0x18
	.long	0x2ae
	.quad	.LBB52
	.quad	.LBE52-.LBB52
	.byte	0x1
	.byte	0x7e
	.long	0x4c0
	.uleb128 0x19
	.long	0x2be
	.long	.LLST5
	.uleb128 0x1a
	.quad	.LVL10
	.long	0x1080
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC20
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.Ldebug_ranges0+0x40
	.long	0x55b
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x49
	.long	0x29
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0x49
	.long	0x29
	.long	.LLST6
	.uleb128 0x1c
	.quad	.LVL12
	.long	0x108f
	.long	0x502
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC18
	.byte	0
	.uleb128 0x1d
	.quad	.LVL79
	.long	0x1031
	.uleb128 0x1c
	.quad	.LVL80
	.long	0x104f
	.long	0x52e
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data36
	.byte	0
	.uleb128 0x1c
	.quad	.LVL83
	.long	0x109e
	.long	0x54d
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data59
	.byte	0
	.uleb128 0x1d
	.quad	.LVL84
	.long	0x105e
	.byte	0
	.uleb128 0x1e
	.quad	.LBB55
	.quad	.LBE55-.LBB55
	.long	0x5bc
	.uleb128 0x17
	.long	.LASF62
	.byte	0x1
	.byte	0x4b
	.long	0x89
	.long	.LLST7
	.uleb128 0x1f
	.long	0x2ae
	.quad	.LBB56
	.quad	.LBE56-.LBB56
	.byte	0x1
	.byte	0x4a
	.uleb128 0x19
	.long	0x2be
	.long	.LLST8
	.uleb128 0x1a
	.quad	.LVL14
	.long	0x1080
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC19
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.Ldebug_ranges0+0x80
	.long	0x71b
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0xc
	.long	0x29
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0xc
	.long	0x29
	.long	.LLST9
	.uleb128 0x20
	.long	.Ldebug_ranges0+0x80
	.uleb128 0x17
	.long	.LASF63
	.byte	0x1
	.byte	0xc
	.long	0xf48
	.long	.LLST10
	.uleb128 0x17
	.long	.LASF64
	.byte	0x1
	.byte	0xc
	.long	0x3b
	.long	.LLST11
	.uleb128 0x1c
	.quad	.LVL85
	.long	0x109e
	.long	0x626
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data47
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1c
	.quad	.LVL86
	.long	0x109e
	.long	0x652
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data46
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1+1
	.byte	0
	.uleb128 0x1d
	.quad	.LVL87
	.long	0x10c4
	.uleb128 0x1d
	.quad	.LVL88
	.long	0x10c4
	.uleb128 0x1c
	.quad	.LVL89
	.long	0x109e
	.long	0x690
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data44
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1d
	.quad	.LVL90
	.long	0x105e
	.uleb128 0x1c
	.quad	.LVL91
	.long	0x109e
	.long	0x6bc
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data42
	.byte	0
	.uleb128 0x1c
	.quad	.LVL107
	.long	0x109e
	.long	0x6e0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data50
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1c
	.quad	.LVL108
	.long	0x109e
	.long	0x70c
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data49
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1+2
	.byte	0
	.uleb128 0x1d
	.quad	.LVL109
	.long	0x10c4
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	0x2ae
	.quad	.LBB64
	.quad	.LBE64-.LBB64
	.byte	0x1
	.byte	0x46
	.long	0x75b
	.uleb128 0x19
	.long	0x2be
	.long	.LLST12
	.uleb128 0x1a
	.quad	.LVL19
	.long	0x1080
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC17
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.Ldebug_ranges0+0xe0
	.long	0x85d
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x2b
	.long	0x29
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0x2b
	.long	0x29
	.long	.LLST13
	.uleb128 0x20
	.long	.Ldebug_ranges0+0xe0
	.uleb128 0x17
	.long	.LASF63
	.byte	0x1
	.byte	0x2b
	.long	0xf48
	.long	.LLST14
	.uleb128 0x17
	.long	.LASF64
	.byte	0x1
	.byte	0x2b
	.long	0x3b
	.long	.LLST15
	.uleb128 0x1d
	.quad	.LVL95
	.long	0x10c4
	.uleb128 0x1c
	.quad	.LVL96
	.long	0x109e
	.long	0x7d2
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data54
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1c
	.quad	.LVL97
	.long	0x109e
	.long	0x7fe
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data53
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8+1
	.byte	0
	.uleb128 0x1c
	.quad	.LVL99
	.long	0x109e
	.long	0x822
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data57
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1c
	.quad	.LVL100
	.long	0x109e
	.long	0x84e
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data56
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8+2
	.byte	0
	.uleb128 0x1d
	.quad	.LVL101
	.long	0x10c4
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.Ldebug_ranges0+0x120
	.long	0xb7c
	.uleb128 0x16
	.string	"a"
	.byte	0x1
	.byte	0x2c
	.long	0x3b
	.uleb128 0x14
	.long	.Ldebug_ranges0+0x190
	.long	0x91b
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x2f
	.long	0x29
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0x2f
	.long	0x29
	.long	.LLST16
	.uleb128 0x1c
	.quad	.LVL27
	.long	0x108f
	.long	0x8b7
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC10
	.byte	0
	.uleb128 0x1c
	.quad	.LVL98
	.long	0x109e
	.long	0x8d6
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data58
	.byte	0
	.uleb128 0x1d
	.quad	.LVL110
	.long	0x1031
	.uleb128 0x1c
	.quad	.LVL111
	.long	0x104f
	.long	0x902
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data23
	.byte	0
	.uleb128 0x1a
	.quad	.LVL112
	.long	0x105e
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x6
	.byte	0x76
	.sleb128 -280
	.byte	0x6
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	0x2ae
	.quad	.LBB73
	.quad	.LBE73-.LBB73
	.byte	0x1
	.byte	0x30
	.long	0x960
	.uleb128 0x19
	.long	0x2be
	.long	.LLST17
	.uleb128 0x1a
	.quad	.LVL29
	.long	0x10f3
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.byte	0
	.byte	0
	.uleb128 0x1e
	.quad	.LBB75
	.quad	.LBE75-.LBB75
	.long	0x9b1
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x32
	.long	0x29
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0x32
	.long	0x29
	.long	.LLST18
	.uleb128 0x1a
	.quad	.LVL31
	.long	0x108f
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC12
	.byte	0
	.byte	0
	.uleb128 0x1e
	.quad	.LBB76
	.quad	.LBE76-.LBB76
	.long	0xa02
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x35
	.long	0x29
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0x35
	.long	0x29
	.long	.LLST19
	.uleb128 0x1a
	.quad	.LVL52
	.long	0x108f
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.quad	.LBB77
	.quad	.LBE77-.LBB77
	.long	0xa3f
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.byte	0x36
	.long	0x3b
	.long	.LLST20
	.uleb128 0x21
	.string	"b"
	.byte	0x1
	.byte	0x37
	.long	0x3b
	.long	.LLST21
	.uleb128 0x1d
	.quad	.LVL54
	.long	0x10fe
	.byte	0
	.uleb128 0x1e
	.quad	.LBB78
	.quad	.LBE78-.LBB78
	.long	0xa90
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x3a
	.long	0x29
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0x3a
	.long	0x29
	.long	.LLST22
	.uleb128 0x1a
	.quad	.LVL59
	.long	0x108f
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC14
	.byte	0
	.byte	0
	.uleb128 0x1e
	.quad	.LBB79
	.quad	.LBE79-.LBB79
	.long	0xae1
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x3d
	.long	0x29
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0x3d
	.long	0x29
	.long	.LLST23
	.uleb128 0x1a
	.quad	.LVL64
	.long	0x108f
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC15
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	0x2ae
	.quad	.LBB80
	.quad	.LBE80-.LBB80
	.byte	0x1
	.byte	0x41
	.long	0xb21
	.uleb128 0x19
	.long	0x2be
	.long	.LLST24
	.uleb128 0x1a
	.quad	.LVL67
	.long	0x1080
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC16
	.byte	0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL26
	.long	0x1159
	.long	0xb47
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x7e
	.sleb128 -192
	.byte	0
	.uleb128 0x1d
	.quad	.LVL28
	.long	0x1169
	.uleb128 0x1d
	.quad	.LVL32
	.long	0x1174
	.uleb128 0x1d
	.quad	.LVL60
	.long	0x117f
	.uleb128 0x1d
	.quad	.LVL65
	.long	0x118a
	.byte	0
	.uleb128 0x14
	.long	.Ldebug_ranges0+0x1d0
	.long	0xf25
	.uleb128 0x15
	.long	.LASF57
	.byte	0x1
	.byte	0x10
	.long	0x96
	.uleb128 0x16
	.string	"len"
	.byte	0x1
	.byte	0x11
	.long	0x29
	.uleb128 0x15
	.long	.LASF58
	.byte	0x1
	.byte	0x12
	.long	0xaa
	.uleb128 0x17
	.long	.LASF60
	.byte	0x1
	.byte	0x16
	.long	0xf53
	.long	.LLST25
	.uleb128 0x22
	.long	0x2ae
	.quad	.LBB86
	.long	.Ldebug_ranges0+0x250
	.byte	0x1
	.byte	0xe
	.long	0xbf6
	.uleb128 0x19
	.long	0x2be
	.long	.LLST26
	.uleb128 0x1a
	.quad	.LVL36
	.long	0x10f3
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	0x2d0
	.quad	.LBB90
	.quad	.LBE90-.LBB90
	.byte	0x1
	.byte	0x17
	.long	0xc3e
	.uleb128 0x19
	.long	0x2eb
	.long	.LLST27
	.uleb128 0x19
	.long	0x2e0
	.long	.LLST28
	.uleb128 0x1a
	.quad	.LVL40
	.long	0xfff
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.Ldebug_ranges0+0x280
	.long	0xcea
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x1a
	.long	0x29
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0x1a
	.long	0x29
	.long	.LLST29
	.uleb128 0x1c
	.quad	.LVL42
	.long	0x108f
	.long	0xc86
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.byte	0
	.uleb128 0x1c
	.quad	.LVL81
	.long	0x105e
	.long	0xca2
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x6
	.byte	0x76
	.sleb128 -288
	.byte	0x6
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x1c
	.quad	.LVL82
	.long	0x109e
	.long	0xcc1
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data51
	.byte	0
	.uleb128 0x1d
	.quad	.LVL93
	.long	0x1031
	.uleb128 0x1a
	.quad	.LVL94
	.long	0x104f
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data11
	.byte	0
	.byte	0
	.uleb128 0x1e
	.quad	.LBB93
	.quad	.LBE93-.LBB93
	.long	0xd3b
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x1d
	.long	0x29
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0x1d
	.long	0x29
	.long	.LLST30
	.uleb128 0x1a
	.quad	.LVL46
	.long	0x108f
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.byte	0
	.byte	0
	.uleb128 0x1e
	.quad	.LBB94
	.quad	.LBE94-.LBB94
	.long	0xd8c
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x20
	.long	0x29
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0x20
	.long	0x29
	.long	.LLST31
	.uleb128 0x1a
	.quad	.LVL49
	.long	0x108f
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.byte	0
	.byte	0
	.uleb128 0x1e
	.quad	.LBB95
	.quad	.LBE95-.LBB95
	.long	0xddd
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x23
	.long	0x29
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0x23
	.long	0x29
	.long	.LLST32
	.uleb128 0x1a
	.quad	.LVL56
	.long	0x108f
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	0x2ae
	.quad	.LBB96
	.quad	.LBE96-.LBB96
	.byte	0x1
	.byte	0x27
	.long	0xe1d
	.uleb128 0x19
	.long	0x2be
	.long	.LLST33
	.uleb128 0x1a
	.quad	.LVL62
	.long	0x1080
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL37
	.long	0x100e
	.long	0xe3c
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x7e
	.sleb128 -128
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 -64
	.byte	0
	.uleb128 0x1c
	.quad	.LVL41
	.long	0x101a
	.long	0xe54
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL43
	.long	0x1026
	.long	0xe6c
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL47
	.long	0x11c0
	.long	0xe86
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x76
	.sleb128 -296
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.quad	.LVL50
	.long	0x11cb
	.long	0xea0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x76
	.sleb128 -296
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.quad	.LVL57
	.long	0x11d6
	.long	0xeba
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x76
	.sleb128 -296
	.byte	0x6
	.byte	0
	.uleb128 0x1d
	.quad	.LVL102
	.long	0x1031
	.uleb128 0x1c
	.quad	.LVL103
	.long	0x104f
	.long	0xee6
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data10
	.byte	0
	.uleb128 0x1d
	.quad	.LVL104
	.long	0x1031
	.uleb128 0x1c
	.quad	.LVL105
	.long	0x1040
	.long	0xf17
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data1
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1d
	.quad	.LVL106
	.long	0x105e
	.byte	0
	.uleb128 0x1d
	.quad	.LVL69
	.long	0x11e1
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x96
	.uleb128 0xc
	.long	0x9c
	.long	0xf48
	.uleb128 0x23
	.long	0x82
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xf4e
	.uleb128 0x7
	.long	0x49
	.uleb128 0xc
	.long	0x9c
	.long	0xf62
	.uleb128 0x23
	.long	0x82
	.byte	0
	.uleb128 0x24
	.long	.LASF65
	.byte	0x8
	.byte	0xa8
	.long	0x282
	.uleb128 0x24
	.long	.LASF66
	.byte	0x8
	.byte	0xa9
	.long	0x282
	.uleb128 0x25
	.long	.LASF67
	.quad	.LFB72
	.quad	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.long	0xfb5
	.uleb128 0x26
	.quad	.LVL113
	.long	0x11ea
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LASAN0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x2d
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	.LASF68
	.quad	.LFB73
	.quad	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.long	0xfff
	.uleb128 0x1d
	.quad	.LVL114
	.long	0x11f9
	.uleb128 0x26
	.quad	.LVL115
	.long	0x1208
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LASAN0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x2d
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF51
	.long	.LASF73
	.byte	0xb
	.byte	0
	.long	.LASF51
	.uleb128 0x28
	.long	.LASF69
	.long	.LASF69
	.byte	0x8
	.value	0x2a6
	.uleb128 0x28
	.long	.LASF70
	.long	.LASF70
	.byte	0x9
	.value	0x1e3
	.uleb128 0x29
	.long	.LASF71
	.long	.LASF71
	.byte	0xa
	.byte	0x6
	.uleb128 0x27
	.long	.LASF72
	.long	.LASF74
	.byte	0xb
	.byte	0
	.long	.LASF72
	.uleb128 0x27
	.long	.LASF75
	.long	.LASF76
	.byte	0xb
	.byte	0
	.long	.LASF75
	.uleb128 0x27
	.long	.LASF77
	.long	.LASF78
	.byte	0xb
	.byte	0
	.long	.LASF77
	.uleb128 0x27
	.long	.LASF79
	.long	.LASF80
	.byte	0xb
	.byte	0
	.long	.LASF79
	.uleb128 0x2a
	.uleb128 0x11
	.byte	0x9e
	.uleb128 0xf
	.byte	0x64
	.byte	0x69
	.byte	0x64
	.byte	0x20
	.byte	0x6e
	.byte	0x6f
	.byte	0x74
	.byte	0x20
	.byte	0x63
	.byte	0x72
	.byte	0x61
	.byte	0x73
	.byte	0x68
	.byte	0xa
	.byte	0
	.uleb128 0x27
	.long	.LASF81
	.long	.LASF82
	.byte	0xb
	.byte	0
	.long	.LASF81
	.uleb128 0x27
	.long	.LASF83
	.long	.LASF84
	.byte	0xb
	.byte	0
	.long	.LASF83
	.uleb128 0x27
	.long	.LASF85
	.long	.LASF86
	.byte	0xb
	.byte	0
	.long	.LASF85
	.uleb128 0x2a
	.uleb128 0x15
	.byte	0x9e
	.uleb128 0x13
	.byte	0x6d
	.byte	0x65
	.byte	0x6d
	.byte	0x6f
	.byte	0x72
	.byte	0x79
	.byte	0x20
	.byte	0x6c
	.byte	0x65
	.byte	0x61
	.byte	0x6b
	.byte	0x20
	.byte	0x73
	.byte	0x74
	.byte	0x61
	.byte	0x72
	.byte	0x74
	.byte	0xa
	.byte	0
	.uleb128 0x27
	.long	.LASF87
	.long	.LASF88
	.byte	0xb
	.byte	0
	.long	.LASF87
	.uleb128 0x2a
	.uleb128 0x1e
	.byte	0x9e
	.uleb128 0x1c
	.byte	0x63
	.byte	0x6f
	.byte	0x6d
	.byte	0x6d
	.byte	0x61
	.byte	0x6e
	.byte	0x64
	.byte	0x73
	.byte	0x3a
	.byte	0x20
	.byte	0x3c
	.byte	0x20
	.byte	0x2d
	.byte	0x69
	.byte	0x20
	.byte	0x2e
	.byte	0x2e
	.byte	0x20
	.byte	0x7c
	.byte	0x20
	.byte	0x2d
	.byte	0x73
	.byte	0x20
	.byte	0x2e
	.byte	0x2e
	.byte	0x3e
	.byte	0xa
	.byte	0
	.uleb128 0x29
	.long	.LASF89
	.long	.LASF89
	.byte	0x3
	.byte	0x57
	.uleb128 0x29
	.long	.LASF90
	.long	.LASF90
	.byte	0xa
	.byte	0x42
	.uleb128 0x2a
	.uleb128 0x4e
	.byte	0x9e
	.uleb128 0x4c
	.byte	0x63
	.byte	0x6f
	.byte	0x6d
	.byte	0x6d
	.byte	0x61
	.byte	0x6e
	.byte	0x64
	.byte	0x73
	.byte	0x3a
	.byte	0x20
	.byte	0x2d
	.byte	0x69
	.byte	0x20
	.byte	0x3c
	.byte	0x69
	.byte	0x6e
	.byte	0x74
	.byte	0x5f
	.byte	0x6f
	.byte	0x76
	.byte	0x65
	.byte	0x72
	.byte	0x7c
	.byte	0x69
	.byte	0x6e
	.byte	0x74
	.byte	0x5f
	.byte	0x75
	.byte	0x6e
	.byte	0x64
	.byte	0x65
	.byte	0x72
	.byte	0x7c
	.byte	0x64
	.byte	0x69
	.byte	0x76
	.byte	0x5f
	.byte	0x62
	.byte	0x79
	.byte	0x5f
	.byte	0x7a
	.byte	0x65
	.byte	0x72
	.byte	0x6f
	.byte	0x7c
	.byte	0x75
	.byte	0x73
	.byte	0x65
	.byte	0x5f
	.byte	0x61
	.byte	0x66
	.byte	0x74
	.byte	0x65
	.byte	0x72
	.byte	0x5f
	.byte	0x66
	.byte	0x72
	.byte	0x65
	.byte	0x65
	.byte	0x7c
	.byte	0x6f
	.byte	0x75
	.byte	0x74
	.byte	0x5f
	.byte	0x6f
	.byte	0x66
	.byte	0x5f
	.byte	0x62
	.byte	0x6f
	.byte	0x75
	.byte	0x6e
	.byte	0x64
	.byte	0x73
	.byte	0x3e
	.byte	0xa
	.byte	0
	.uleb128 0x2b
	.long	.LASF91
	.long	.LASF92
	.byte	0x8
	.value	0x1be
	.long	.LASF91
	.uleb128 0x29
	.long	.LASF93
	.long	.LASF93
	.byte	0xa
	.byte	0x18
	.uleb128 0x29
	.long	.LASF94
	.long	.LASF94
	.byte	0xa
	.byte	0x1a
	.uleb128 0x29
	.long	.LASF95
	.long	.LASF95
	.byte	0xa
	.byte	0x34
	.uleb128 0x29
	.long	.LASF96
	.long	.LASF96
	.byte	0xa
	.byte	0x3c
	.uleb128 0x2a
	.uleb128 0x29
	.byte	0x9e
	.uleb128 0x27
	.byte	0x63
	.byte	0x6f
	.byte	0x6d
	.byte	0x6d
	.byte	0x61
	.byte	0x6e
	.byte	0x64
	.byte	0x73
	.byte	0x3a
	.byte	0x20
	.byte	0x2d
	.byte	0x73
	.byte	0x20
	.byte	0x3c
	.byte	0x62
	.byte	0x75
	.byte	0x66
	.byte	0x66
	.byte	0x7c
	.byte	0x73
	.byte	0x74
	.byte	0x61
	.byte	0x63
	.byte	0x6b
	.byte	0x7c
	.byte	0x68
	.byte	0x65
	.byte	0x61
	.byte	0x70
	.byte	0x7c
	.byte	0x67
	.byte	0x6c
	.byte	0x6f
	.byte	0x62
	.byte	0x61
	.byte	0x6c
	.byte	0x3e
	.byte	0xa
	.byte	0
	.uleb128 0x29
	.long	.LASF97
	.long	.LASF97
	.byte	0xa
	.byte	0xc
	.uleb128 0x29
	.long	.LASF98
	.long	.LASF98
	.byte	0xa
	.byte	0x12
	.uleb128 0x29
	.long	.LASF99
	.long	.LASF99
	.byte	0xa
	.byte	0x2e
	.uleb128 0x2c
	.long	.LASF111
	.long	.LASF111
	.uleb128 0x27
	.long	.LASF100
	.long	.LASF101
	.byte	0xb
	.byte	0
	.long	.LASF100
	.uleb128 0x27
	.long	.LASF102
	.long	.LASF103
	.byte	0xb
	.byte	0
	.long	.LASF102
	.uleb128 0x27
	.long	.LASF104
	.long	.LASF105
	.byte	0xb
	.byte	0
	.long	.LASF104
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x34
	.uleb128 0x19
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
	.uleb128 0x26
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x2a
	.uleb128 0x36
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.quad	.LVL0
	.quad	.LVL1
	.value	0x1
	.byte	0x55
	.quad	.LVL1
	.quad	.LVL2
	.value	0x1
	.byte	0x5d
	.quad	.LVL2
	.quad	.LVL11
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL11
	.quad	.LVL18
	.value	0x1
	.byte	0x5d
	.quad	.LVL18
	.quad	.LVL20
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL20
	.quad	.LVL21
	.value	0x1
	.byte	0x5d
	.quad	.LVL21
	.quad	.LVL70
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL70
	.quad	.LVL71
	.value	0x1
	.byte	0x55
	.quad	.LVL71
	.quad	.LVL74
	.value	0x1
	.byte	0x5d
	.quad	.LVL74
	.quad	.LVL78
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL78
	.quad	.LVL80
	.value	0x1
	.byte	0x5d
	.quad	.LVL80
	.quad	.LVL82
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL82
	.quad	.LVL84
	.value	0x1
	.byte	0x5d
	.quad	.LVL84
	.quad	.LVL86
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL86
	.quad	.LVL87
	.value	0x1
	.byte	0x5d
	.quad	.LVL87
	.quad	.LVL88
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL88
	.quad	.LVL91
	.value	0x1
	.byte	0x5d
	.quad	.LVL91
	.quad	.LFE71
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0
	.quad	.LVL1
	.value	0x1
	.byte	0x54
	.quad	.LVL1
	.quad	.LVL70
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL70
	.quad	.LVL72
	.value	0x1
	.byte	0x54
	.quad	.LVL72
	.quad	.LVL73-1
	.value	0x1
	.byte	0x59
	.quad	.LVL73-1
	.quad	.LVL74
	.value	0x3
	.byte	0x76
	.sleb128 -280
	.quad	.LVL74
	.quad	.LFE71
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL4
	.quad	.LVL9
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL76
	.quad	.LVL78
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL5
	.quad	.LVL6
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL5
	.quad	.LVL6
	.value	0x1
	.byte	0x57
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL9
	.quad	.LVL10
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+4205
	.sleb128 0
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL11
	.quad	.LVL15
	.value	0x2
	.byte	0x35
	.byte	0x9f
	.quad	.LVL78
	.quad	.LVL80
	.value	0x2
	.byte	0x35
	.byte	0x9f
	.quad	.LVL82
	.quad	.LVL84
	.value	0x2
	.byte	0x35
	.byte	0x9f
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL14
	.quad	.LVL15
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL13
	.quad	.LVL14
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+4269
	.sleb128 0
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL15
	.quad	.LVL68
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL80
	.quad	.LVL82
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL84
	.quad	.LVL91
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL92
	.quad	.LFE71
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL16
	.quad	.LVL19-1
	.value	0x1
	.byte	0x58
	.quad	.LVL20
	.quad	.LVL26-1
	.value	0x1
	.byte	0x58
	.quad	.LVL33
	.quad	.LVL36-1
	.value	0x1
	.byte	0x58
	.quad	.LVL84
	.quad	.LVL85-1
	.value	0x1
	.byte	0x58
	.quad	.LVL85
	.quad	.LVL86-1
	.value	0x1
	.byte	0x58
	.quad	.LVL86
	.quad	.LVL87-1
	.value	0x1
	.byte	0x58
	.quad	.LVL87
	.quad	.LVL88-1
	.value	0x1
	.byte	0x58
	.quad	.LVL88
	.quad	.LVL89-1
	.value	0x1
	.byte	0x58
	.quad	.LVL94
	.quad	.LVL95-1
	.value	0x1
	.byte	0x58
	.quad	.LVL95
	.quad	.LVL96-1
	.value	0x1
	.byte	0x58
	.quad	.LVL96
	.quad	.LVL97-1
	.value	0x1
	.byte	0x58
	.quad	.LVL98
	.quad	.LVL99-1
	.value	0x1
	.byte	0x58
	.quad	.LVL99
	.quad	.LVL100-1
	.value	0x1
	.byte	0x58
	.quad	.LVL100
	.quad	.LVL101-1
	.value	0x1
	.byte	0x58
	.quad	.LVL106
	.quad	.LVL107-1
	.value	0x1
	.byte	0x58
	.quad	.LVL107
	.quad	.LVL108-1
	.value	0x1
	.byte	0x58
	.quad	.LVL108
	.quad	.LVL109-1
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL17
	.quad	.LVL18
	.value	0xb
	.byte	0x8
	.byte	0x2d
	.byte	0x78
	.sleb128 0
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL20
	.quad	.LVL22
	.value	0xb
	.byte	0x8
	.byte	0x2d
	.byte	0x78
	.sleb128 0
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL22
	.quad	.LVL23
	.value	0xb
	.byte	0x8
	.byte	0x73
	.byte	0x78
	.sleb128 1
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL33
	.quad	.LVL34
	.value	0xb
	.byte	0x8
	.byte	0x73
	.byte	0x78
	.sleb128 1
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL34
	.quad	.LVL36-1
	.value	0x9
	.byte	0x78
	.sleb128 2
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1f
	.byte	0x9f
	.quad	.LVL84
	.quad	.LVL85-1
	.value	0xb
	.byte	0x8
	.byte	0x2d
	.byte	0x78
	.sleb128 0
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL85
	.quad	.LVL86-1
	.value	0xb
	.byte	0x8
	.byte	0x2d
	.byte	0x78
	.sleb128 0
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL87
	.quad	.LVL88-1
	.value	0xb
	.byte	0x8
	.byte	0x2d
	.byte	0x78
	.sleb128 0
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL106
	.quad	.LVL107-1
	.value	0xb
	.byte	0x8
	.byte	0x73
	.byte	0x78
	.sleb128 1
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL107
	.quad	.LVL108-1
	.value	0xb
	.byte	0x8
	.byte	0x73
	.byte	0x78
	.sleb128 1
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL108
	.quad	.LVL109-1
	.value	0xb
	.byte	0x8
	.byte	0x73
	.byte	0x78
	.sleb128 1
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL18
	.quad	.LVL20
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+4307
	.sleb128 0
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL23
	.quad	.LVL33
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL51
	.quad	.LVL55
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL58
	.quad	.LVL61
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL63
	.quad	.LVL68
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL94
	.quad	.LVL101
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL109
	.quad	.LFE71
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL23
	.quad	.LVL26-1
	.value	0x1
	.byte	0x58
	.quad	.LVL94
	.quad	.LVL95-1
	.value	0x1
	.byte	0x58
	.quad	.LVL95
	.quad	.LVL96-1
	.value	0x1
	.byte	0x58
	.quad	.LVL96
	.quad	.LVL97-1
	.value	0x1
	.byte	0x58
	.quad	.LVL98
	.quad	.LVL99-1
	.value	0x1
	.byte	0x58
	.quad	.LVL99
	.quad	.LVL100-1
	.value	0x1
	.byte	0x58
	.quad	.LVL100
	.quad	.LVL101-1
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL23
	.quad	.LVL24
	.value	0xb
	.byte	0x8
	.byte	0x2d
	.byte	0x78
	.sleb128 0
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL24
	.quad	.LVL25
	.value	0xb
	.byte	0x8
	.byte	0x69
	.byte	0x78
	.sleb128 1
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL25
	.quad	.LVL26-1
	.value	0x9
	.byte	0x78
	.sleb128 2
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1f
	.byte	0x9f
	.quad	.LVL94
	.quad	.LVL95-1
	.value	0xb
	.byte	0x8
	.byte	0x2d
	.byte	0x78
	.sleb128 0
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL95
	.quad	.LVL96-1
	.value	0xb
	.byte	0x8
	.byte	0x2d
	.byte	0x78
	.sleb128 0
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL96
	.quad	.LVL97-1
	.value	0xb
	.byte	0x8
	.byte	0x2d
	.byte	0x78
	.sleb128 0
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL98
	.quad	.LVL99-1
	.value	0xb
	.byte	0x8
	.byte	0x69
	.byte	0x78
	.sleb128 1
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL99
	.quad	.LVL100-1
	.value	0xb
	.byte	0x8
	.byte	0x69
	.byte	0x78
	.sleb128 1
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL100
	.quad	.LVL101-1
	.value	0xb
	.byte	0x8
	.byte	0x69
	.byte	0x78
	.sleb128 1
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL26
	.quad	.LVL33
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL51
	.quad	.LVL55
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL58
	.quad	.LVL61
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL63
	.quad	.LVL68
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL97
	.quad	.LVL98
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	.LVL109
	.quad	.LFE71
	.value	0x2
	.byte	0x38
	.byte	0x9f
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL28
	.quad	.LVL30
	.value	0xa
	.byte	0x3
	.quad	.LC11
	.byte	0x9f
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL30
	.quad	.LVL33
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	.LVL51
	.quad	.LVL55
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	.LVL58
	.quad	.LVL61
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	.LVL63
	.quad	.LVL68
	.value	0x2
	.byte	0x39
	.byte	0x9f
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL51
	.quad	.LVL55
	.value	0x2
	.byte	0x3b
	.byte	0x9f
	.quad	.LVL58
	.quad	.LVL61
	.value	0x2
	.byte	0x3b
	.byte	0x9f
	.quad	.LVL63
	.quad	.LVL68
	.value	0x2
	.byte	0x3b
	.byte	0x9f
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL53
	.quad	.LVL55
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL53
	.quad	.LVL55
	.value	0x2
	.byte	0x36
	.byte	0x9f
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL58
	.quad	.LVL61
	.value	0x2
	.byte	0x3e
	.byte	0x9f
	.quad	.LVL63
	.quad	.LVL68
	.value	0x2
	.byte	0x3e
	.byte	0x9f
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL63
	.quad	.LVL68
	.value	0x2
	.byte	0x3d
	.byte	0x9f
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL66
	.quad	.LVL68
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+4361
	.sleb128 0
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL38
	.quad	.LVL44
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL44
	.quad	.LVL45
	.value	0x4
	.byte	0x76
	.sleb128 -296
	.byte	0x6
	.quad	.LVL45
	.quad	.LVL51
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL55
	.quad	.LVL58
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL61
	.quad	.LVL63
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL80
	.quad	.LVL82
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL92
	.quad	.LVL94
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL101
	.quad	.LVL103
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL35
	.quad	.LVL36
	.value	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL39
	.quad	.LVL40-1
	.value	0x1
	.byte	0x54
	.quad	.LVL40-1
	.quad	.LVL40
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL39
	.quad	.LVL40
	.value	0x1
	.byte	0x57
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL41
	.quad	.LVL51
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL55
	.quad	.LVL58
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL61
	.quad	.LVL63
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL80
	.quad	.LVL82
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL92
	.quad	.LVL94
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL45
	.quad	.LVL51
	.value	0x2
	.byte	0x35
	.byte	0x9f
	.quad	.LVL55
	.quad	.LVL58
	.value	0x2
	.byte	0x35
	.byte	0x9f
	.quad	.LVL61
	.quad	.LVL63
	.value	0x2
	.byte	0x35
	.byte	0x9f
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL48
	.quad	.LVL51
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL55
	.quad	.LVL58
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL61
	.quad	.LVL63
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0
	.quad	0
.LLST32:
	.quad	.LVL55
	.quad	.LVL58
	.value	0x2
	.byte	0x36
	.byte	0x9f
	.quad	.LVL61
	.quad	.LVL63
	.value	0x2
	.byte	0x36
	.byte	0x9f
	.quad	0
	.quad	0
.LLST33:
	.quad	.LVL61
	.quad	.LVL63
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+4501
	.sleb128 0
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x4c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB71
	.quad	.LFE71-.LFB71
	.quad	.LFB72
	.quad	.LFE72-.LFB72
	.quad	.LFB73
	.quad	.LFE73-.LFB73
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB49
	.quad	.LBE49
	.quad	.LBB106
	.quad	.LBE106
	.quad	.LBB111
	.quad	.LBE111
	.quad	0
	.quad	0
	.quad	.LBB54
	.quad	.LBE54
	.quad	.LBB107
	.quad	.LBE107
	.quad	.LBB109
	.quad	.LBE109
	.quad	0
	.quad	0
	.quad	.LBB58
	.quad	.LBE58
	.quad	.LBB66
	.quad	.LBE66
	.quad	.LBB84
	.quad	.LBE84
	.quad	.LBB110
	.quad	.LBE110
	.quad	.LBB117
	.quad	.LBE117
	.quad	0
	.quad	0
	.quad	.LBB67
	.quad	.LBE67
	.quad	.LBB113
	.quad	.LBE113
	.quad	.LBB115
	.quad	.LBE115
	.quad	0
	.quad	0
	.quad	.LBB71
	.quad	.LBE71
	.quad	.LBB101
	.quad	.LBE101
	.quad	.LBB103
	.quad	.LBE103
	.quad	.LBB105
	.quad	.LBE105
	.quad	.LBB114
	.quad	.LBE114
	.quad	.LBB118
	.quad	.LBE118
	.quad	0
	.quad	0
	.quad	.LBB72
	.quad	.LBE72
	.quad	.LBB82
	.quad	.LBE82
	.quad	.LBB83
	.quad	.LBE83
	.quad	0
	.quad	0
	.quad	.LBB85
	.quad	.LBE85
	.quad	.LBB100
	.quad	.LBE100
	.quad	.LBB102
	.quad	.LBE102
	.quad	.LBB104
	.quad	.LBE104
	.quad	.LBB108
	.quad	.LBE108
	.quad	.LBB112
	.quad	.LBE112
	.quad	.LBB116
	.quad	.LBE116
	.quad	0
	.quad	0
	.quad	.LBB86
	.quad	.LBE86
	.quad	.LBB89
	.quad	.LBE89
	.quad	0
	.quad	0
	.quad	.LBB92
	.quad	.LBE92
	.quad	.LBB98
	.quad	.LBE98
	.quad	.LBB99
	.quad	.LBE99
	.quad	0
	.quad	0
	.quad	.LFB71
	.quad	.LFE71
	.quad	.LFB72
	.quad	.LFE72
	.quad	.LFB73
	.quad	.LFE73
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF29:
	.string	"_chain"
.LASF32:
	.string	"_old_offset"
.LASF82:
	.string	"__builtin_puts"
.LASF89:
	.string	"__printf_chk"
.LASF45:
	.string	"_IO_FILE"
.LASF92:
	.string	"scanf"
.LASF27:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF10:
	.string	"sizetype"
.LASF91:
	.string	"__isoc99_scanf"
.LASF37:
	.string	"_offset"
.LASF93:
	.string	"integer_overflow"
.LASF90:
	.string	"division_by_zero"
.LASF79:
	.string	"__asan_report_load8"
.LASF61:
	.string	"__s2_len"
.LASF21:
	.string	"_IO_write_ptr"
.LASF16:
	.string	"_flags"
.LASF60:
	.string	"buff"
.LASF23:
	.string	"_IO_buf_base"
.LASF14:
	.string	"ssize_t"
.LASF63:
	.string	"__s2"
.LASF28:
	.string	"_markers"
.LASF18:
	.string	"_IO_read_end"
.LASF69:
	.string	"getline"
.LASF106:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -g -O0 -O3 -fsanitize=address,undefined -fno-sanitize-recover=undefined -funroll-loops -fstack-protector-strong"
.LASF57:
	.string	"line"
.LASF70:
	.string	"free"
.LASF77:
	.string	"__ubsan_handle_nonnull_arg_abort"
.LASF56:
	.string	"argv"
.LASF100:
	.string	"__asan_unregister_globals"
.LASF13:
	.string	"long long int"
.LASF67:
	.string	"_GLOBAL__sub_D_00099_0_main"
.LASF99:
	.string	"global_buffer_overflow"
.LASF65:
	.string	"stdin"
.LASF11:
	.string	"__ssize_t"
.LASF36:
	.string	"_lock"
.LASF98:
	.string	"heap_overflow"
.LASF105:
	.string	"__builtin___asan_register_globals"
.LASF71:
	.string	"buffer_overflow"
.LASF53:
	.string	"__dest"
.LASF50:
	.string	"printf"
.LASF0:
	.string	"long unsigned int"
.LASF33:
	.string	"_cur_column"
.LASF49:
	.string	"_pos"
.LASF102:
	.string	"__asan_init_v4"
.LASF95:
	.string	"use_after_free"
.LASF34:
	.string	"_vtable_offset"
.LASF101:
	.string	"__builtin___asan_unregister_globals"
.LASF88:
	.string	"__builtin___asan_report_load1"
.LASF104:
	.string	"__asan_register_globals"
.LASF2:
	.string	"unsigned char"
.LASF54:
	.string	"__src"
.LASF55:
	.string	"argc"
.LASF58:
	.string	"read"
.LASF4:
	.string	"signed char"
.LASF15:
	.string	"long long unsigned int"
.LASF73:
	.string	"__builtin_strcpy"
.LASF1:
	.string	"unsigned int"
.LASF46:
	.string	"_IO_marker"
.LASF35:
	.string	"_shortbuf"
.LASF64:
	.string	"__result"
.LASF38:
	.string	"__pad1"
.LASF9:
	.string	"__off64_t"
.LASF81:
	.string	"puts"
.LASF20:
	.string	"_IO_write_base"
.LASF44:
	.string	"_unused2"
.LASF108:
	.string	"/home/francis/Documents/ThesisWork/Instrumentation"
.LASF17:
	.string	"_IO_read_ptr"
.LASF68:
	.string	"_GLOBAL__sub_I_00099_1_main"
.LASF24:
	.string	"_IO_buf_end"
.LASF76:
	.string	"__builtin___ubsan_handle_vla_bound_not_positive_abort"
.LASF12:
	.string	"char"
.LASF6:
	.string	"long int"
.LASF110:
	.string	"main"
.LASF47:
	.string	"_next"
.LASF51:
	.string	"strcpy"
.LASF39:
	.string	"__pad2"
.LASF40:
	.string	"__pad3"
.LASF41:
	.string	"__pad4"
.LASF42:
	.string	"__pad5"
.LASF84:
	.string	"__builtin_strcmp"
.LASF3:
	.string	"short unsigned int"
.LASF52:
	.string	"__fmt"
.LASF94:
	.string	"integer_underflow"
.LASF22:
	.string	"_IO_write_end"
.LASF86:
	.string	"__builtin___ubsan_handle_type_mismatch_abort"
.LASF103:
	.string	"__builtin___asan_init_v4"
.LASF96:
	.string	"out_of_bounds"
.LASF30:
	.string	"_fileno"
.LASF59:
	.string	"__s1_len"
.LASF74:
	.string	"__builtin___asan_handle_no_return"
.LASF8:
	.string	"__off_t"
.LASF26:
	.string	"_IO_backup_base"
.LASF107:
	.string	"./harness.c"
.LASF83:
	.string	"strcmp"
.LASF62:
	.string	"pointer"
.LASF31:
	.string	"_flags2"
.LASF78:
	.string	"__builtin___ubsan_handle_nonnull_arg_abort"
.LASF43:
	.string	"_mode"
.LASF19:
	.string	"_IO_read_base"
.LASF75:
	.string	"__ubsan_handle_vla_bound_not_positive_abort"
.LASF80:
	.string	"__builtin___asan_report_load8"
.LASF25:
	.string	"_IO_save_base"
.LASF72:
	.string	"__asan_handle_no_return"
.LASF111:
	.string	"__stack_chk_fail"
.LASF48:
	.string	"_sbuf"
.LASF97:
	.string	"stack_overflow"
.LASF87:
	.string	"__asan_report_load1"
.LASF66:
	.string	"stdout"
.LASF109:
	.string	"_IO_lock_t"
.LASF85:
	.string	"__ubsan_handle_type_mismatch_abort"
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
  jne  __afl_die

  /* Once woken up, create a clone of our process. This is an excell