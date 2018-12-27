	.file	"vul.c"
	.text
.Ltext0:
	.globl	__asan_stack_malloc_1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"1 32 5 6 buffer "
	.section	.rodata
	.align 32
.LC1:
	.string	"buffer content= %s\n"
	.zero	44
	.align 32
.LC2:
	.string	"strcpy() executed..."
	.zero	43
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.text
	.globl	buffer_overflow
	.type	buffer_overflow, @function
buffer_overflow:
.LASANPC60:
.LFB60:
	.file 1 "vul.c"
	.loc 1 13 0
	.cfi_startproc
.LVL0:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00001a8f, %rcx
movl $0x00001a8f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %rbx
	movq	%rsp, %r14
	testl	%eax, %eax
	jne	.L9

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
	.loc 1 13 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00003d64, %rcx
movl $0x00003d64, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rbx, %rbp
	movq	$1102416563, (%rbx)
	movq	$.LC0, 8(%rbx)
	shrq	$3, %rbp
	movq	$.LASANPC60, 16(%rbx)
	movl	$-235802127, 2147450880(%rbp)
	movl	$-185273339, 2147450884(%rbp)
	movl	$-202116109, 2147450888(%rbp)
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	.loc 1 25 0
	testq	%r12, %r12
	je	.L10

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000a80c, %rcx
movl $0x0000a80c, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LVL2:
.LBB35:
.LBB36:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/string3.h"
	.loc 2 110 0
	leaq	32(%rbx), %r13
	movl	$5, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	__strcpy_chk
.LVL3:
.LBE36:
.LBE35:
.LBB37:
.LBB38:
	.file 3 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 3 104 0
	movq	%r13, %rdx
	movl	$.LC1, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.LVL4:
.LBE38:
.LBE37:
.LBB39:
.LBB40:
	movl	$.LC2, %edi
	call	puts
.LVL5:
.LBE40:
.LBE39:
	.loc 1 13 0
	cmpq	%rbx, %r14
	jne	.L11

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000fa3, %rcx
movl $0x00000fa3, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	$0, 2147450880(%rbp)
	movl	$0, 2147450888(%rbp)
.L3:
	.loc 1 30 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00007590, %rcx
movl $0x00007590, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	88(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L12

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000a32a, %rcx
movl $0x0000a32a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
.LVL6:
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.LVL7:
.L9:
	.cfi_restore_state
	.loc 1 13 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000049a8, %rcx
movl $0x000049a8, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rsp, %rsi
	movl	$96, %edi
.LVL8:
	call	__asan_stack_malloc_1
.LVL9:
	movq	%rax, %rbx
	jmp	.L1
.L12:
	.loc 1 30 0

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
.LVL10:
.L11:
	.loc 1 13 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00006cec, %rcx
movl $0x00006cec, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movabsq	$-723401728380766731, %rdx
	movq	$1172321806, (%rbx)
	movl	$-168430091, 2147450888(%rbp)
	movq	%rdx, 2147450880(%rbp)
	jmp	.L3
.L10:
	.loc 1 25 0

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
.LVL11:
	movl	$.Lubsan_data7, %edi
	call	__ubsan_handle_nonnull_arg_abort
.LVL12:
	.cfi_endproc
.LFE60:
	.size	buffer_overflow, .-buffer_overflow
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.rodata
	.align 32
.LC4:
	.string	"Stack Overflow example"
	.zero	41
	.section	.text.unlikely
.LCOLDB5:
	.text
.LHOTB5:
	.p2align 4,,15
	.globl	stack_overflow
	.type	stack_overflow, @function
stack_overflow:
.LASANPC61:
.LFB61:
	.loc 1 33 0
	.cfi_startproc
.LVL13:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000066c6, %rcx
movl $0x000066c6, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, %rbx
.LBB41:
.LBB42:
	.loc 3 104 0
	movl	$.LC4, %edi
.LVL14:
.LBE42:
.LBE41:
	.loc 1 33 0
	subq	$24, %rsp
	.loc 1 33 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
.LVL15:
.LBB44:
.LBB43:
	.loc 3 104 0
	call	puts
.LVL16:
.LBE43:
.LBE44:
	.loc 1 35 0
	testq	%rbx, %rbx
	je	.L18

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000619d, %rcx
movl $0x0000619d, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rbx, %rdi
	call	strlen
.LVL17:
	testq	%rax, %rax
	je	.L19

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000e62, %rcx
movl $0x00000e62, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 35 0 is_stmt 0 discriminator 2
	leaq	15(%rax), %rdx
.LBB45:
.LBB46:
	.loc 2 110 0 is_stmt 1 discriminator 2
	movq	%rbx, %rsi
.LBE46:
.LBE45:
	.loc 1 35 0 discriminator 2
	andq	$-16, %rdx
	subq	%rdx, %rsp
.LVL18:
.LBB48:
.LBB47:
	.loc 2 110 0 discriminator 2
	leaq	1(%rax), %rdx
	movq	%rsp, %rdi
	call	memcpy
.LVL19:
.LBE47:
.LBE48:
.LBB49:
.LBB50:
	.loc 3 104 0 discriminator 2
	movq	%rsp, %rdi
	call	puts
.LVL20:
.LBE50:
.LBE49:
	.loc 1 38 0 discriminator 2
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L20

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00007db8, %rcx
movl $0x00007db8, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 38 0 is_stmt 0
	movq	-8(%rbp), %rbx
.LVL21:
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
.LVL22:
	ret
.LVL23:
.L18:
	.cfi_restore_state
	.loc 1 35 0 is_stmt 1

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
.LVL24:
	movl	$.Lubsan_data11, %edi
	call	__ubsan_handle_nonnull_arg_abort
.LVL25:
.L20:
	.loc 1 38 0

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
.LVL26:
.L19:
	.loc 1 35 0 discriminator 1

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
.LVL27:
	xorl	%esi, %esi
	movl	$.Lubsan_data1, %edi
	call	__ubsan_handle_vla_bound_not_positive_abort
.LVL28:
	.cfi_endproc
.LFE61:
	.size	stack_overflow, .-stack_overflow
	.section	.text.unlikely
.LCOLDE5:
	.text
.LHOTE5:
	.section	.rodata
	.align 32
.LC6:
	.string	"In heap overflow"
	.zero	47
	.section	.text.unlikely
.LCOLDB7:
	.text
.LHOTB7:
	.p2align 4,,15
	.globl	heap_overflow
	.type	heap_overflow, @function
heap_overflow:
.LASANPC62:
.LFB62:
	.loc 1 42 0
	.cfi_startproc
.LVL29:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000ad2c, %rcx
movl $0x0000ad2c, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 42 0
	movq	%rdi, %rbx
.LBB51:
.LBB52:
	.loc 3 104 0
	movl	$.LC6, %edi
.LVL30:
	call	puts
.LVL31:
.LBE52:
.LBE51:
	.loc 1 44 0
	testq	%rbx, %rbx
	je	.L26

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00005f90, %rcx
movl $0x00005f90, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rbx, %rdi
	call	strlen
.LVL32:
	cmpq	$5, %rax
	jbe	.L21

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000604f, %rcx
movl $0x0000604f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 47 0
	movq	%rax, %rdi
	call	malloc
.LVL33:
	.loc 1 48 0
	testq	%rax, %rax
	je	.L27

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

.LVL34:
.L21:
	.loc 1 49 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000c0b, %rcx
movl $0x00000c0b, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
.LVL35:
	ret
.LVL36:
.L27:
	.cfi_restore_state
	.loc 1 48 0

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
.LVL37:
	movl	$.Lubsan_data18, %edi
	call	__ubsan_handle_nonnull_arg_abort
.LVL38:
.L26:
	.loc 1 44 0

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
.LVL39:
	movl	$.Lubsan_data16, %edi
	call	__ubsan_handle_nonnull_arg_abort
.LVL40:
	.cfi_endproc
.LFE62:
	.size	heap_overflow, .-heap_overflow
	.section	.text.unlikely
.LCOLDE7:
	.text
.LHOTE7:
	.section	.rodata
	.align 32
.LC8:
	.string	"buffer = %s\n"
	.zero	51
	.section	.text.unlikely
.LCOLDB9:
	.text
.LHOTB9:
	.p2align 4,,15
	.globl	global_buffer_overflow
	.type	global_buffer_overflow, @function
global_buffer_overflow:
.LASANPC63:
.LFB63:
	.loc 1 54 0
	.cfi_startproc
.LVL41:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00001be1, %rcx
movl $0x00001be1, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 55 0
	testq	%rdi, %rdi
	je	.L31

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000451d, %rcx
movl $0x0000451d, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LVL42:
.LBB53:
.LBB54:
	.loc 2 110 0
	movq	%rdi, %rsi
	movl	$20, %edx
	movl	$global_buffer, %edi
.LVL43:
	call	__strcpy_chk
.LVL44:
.LBE54:
.LBE53:
.LBB55:
.LBB56:
	.loc 3 104 0
	movl	$global_buffer, %edx
	movl	$.LC8, %esi
	movl	$1, %edi
	xorl	%eax, %eax
.LBE56:
.LBE55:
	.loc 1 57 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
.LBB58:
.LBB57:
	.loc 3 104 0
	jmp	__printf_chk
.LVL45:
.L31:
	.cfi_restore_state
.LBE57:
.LBE58:
	.loc 1 55 0

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
.LVL46:
	movl	$.Lubsan_data21, %edi
	call	__ubsan_handle_nonnull_arg_abort
.LVL47:
	.cfi_endproc
.LFE63:
	.size	global_buffer_overflow, .-global_buffer_overflow
	.section	.text.unlikely
.LCOLDE9:
	.text
.LHOTE9:
	.section	.text.unlikely
.LCOLDB10:
	.text
.LHOTB10:
	.p2align 4,,15
	.globl	integer_overflow
	.type	integer_overflow, @function
integer_overflow:
.LASANPC64:
.LFB64:
	.loc 1 60 0
	.cfi_startproc
.LVL48:
	.loc 1 61 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000040d2, %rcx
movl $0x000040d2, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	cmpl	$101, %edi
	movl	$-2147483648, %eax
	cmovne	%edi, %eax
	.loc 1 66 0
	ret
	.cfi_endproc
.LFE64:
	.size	integer_overflow, .-integer_overflow
	.section	.text.unlikely
.LCOLDE10:
	.text
.LHOTE10:
	.section	.text.unlikely
.LCOLDB11:
	.text
.LHOTB11:
	.p2align 4,,15
	.globl	integer_underflow
	.type	integer_underflow, @function
integer_underflow:
.LASANPC65:
.LFB65:
	.loc 1 72 0
	.cfi_startproc
.LVL49:
	.loc 1 73 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000040d2, %rcx
movl $0x000040d2, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	cmpl	$10002, %edi
	movl	$2147483647, %eax
	cmovne	%edi, %eax
	.loc 1 74 0
	ret
	.cfi_endproc
.LFE65:
	.size	integer_underflow, .-integer_underflow
	.section	.text.unlikely
.LCOLDE11:
	.text
.LHOTE11:
	.section	.rodata.str1.1
.LC12:
	.string	"1 32 1 1 c "
	.section	.rodata
	.align 32
.LC13:
	.string	"entered dangling pointer"
	.zero	39
	.section	.text.unlikely
.LCOLDB14:
	.text
.LHOTB14:
	.p2align 4,,15
	.globl	dangling_pointer
	.type	dangling_pointer, @function
dangling_pointer:
.LASANPC66:
.LFB66:
	.loc 1 83 0
	.cfi_startproc
.LVL50:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00004323, %rcx
movl $0x00004323, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%edi, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %rbx
	movq	%rsp, %r12
	testl	%eax, %eax
	jne	.L45

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

.LVL51:
.L38:
	.loc 1 83 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000433f, %rcx
movl $0x0000433f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rbx, %rbp
	movq	$1102416563, (%rbx)
	movq	$.LC12, 8(%rbx)
	shrq	$3, %rbp
	movq	$.LASANPC66, 16(%rbx)
.LBB59:
.LBB60:
	.loc 3 104 0
	movl	$.LC13, %edi
.LBE60:
.LBE59:
	.loc 1 83 0
	movl	$-235802127, 2147450880(%rbp)
	movl	$-185273343, 2147450884(%rbp)
	movl	$-202116109, 2147450888(%rbp)
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
.LVL52:
.LBB62:
.LBB61:
	.loc 3 104 0
	call	puts
.LVL53:
.LBE61:
.LBE62:
	.loc 1 86 0
	cmpl	$10, %r13d
	je	.L46

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

.L41:
	.loc 1 83 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000b9f, %rcx
movl $0x00000b9f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	cmpq	%rbx, %r12
	jne	.L47

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000fa3, %rcx
movl $0x00000fa3, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	$0, 2147450880(%rbp)
	movl	$0, 2147450888(%rbp)
.L40:
	.loc 1 97 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00007590, %rcx
movl $0x00007590, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	88(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L48

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000007, %rcx
movl $0x00000007, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL54:
	ret
.LVL55:
	.p2align 4,,10
	.p2align 3
.L46:
	.cfi_restore_state
.LBB63:
.LBB64:
	.loc 3 104 0
	leaq	32(%rbx), %rdi
	call	puts
.LVL56:
	jmp	.L41
.LVL57:
.L47:
.LBE64:
.LBE63:
	.loc 1 83 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00006cec, %rcx
movl $0x00006cec, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movabsq	$-723401728380766731, %rdx
	movq	$1172321806, (%rbx)
	movl	$-168430091, 2147450888(%rbp)
	movq	%rdx, 2147450880(%rbp)
	jmp	.L40
.LVL58:
.L45:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000049a8, %rcx
movl $0x000049a8, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rsp, %rsi
	movl	$96, %edi
.LVL59:
	call	__asan_stack_malloc_1
.LVL60:
	movq	%rax, %rbx
	jmp	.L38
.L48:
	.loc 1 97 0

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
.LVL61:
	.cfi_endproc
.LFE66:
	.size	dangling_pointer, .-dangling_pointer
	.section	.text.unlikely
.LCOLDE14:
	.text
.LHOTE14:
	.section	.text.unlikely
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4,,15
	.globl	memory_leak
	.type	memory_leak, @function
memory_leak:
.LASANPC67:
.LFB67:
	.loc 1 102 0
	.cfi_startproc
.LVL62:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ab5, %rcx
movl $0x00000ab5, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	rep ret
	.cfi_endproc
.LFE67:
	.size	memory_leak, .-memory_leak
	.section	.text.unlikely
.LCOLDE15:
	.text
.LHOTE15:
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4,,15
	.globl	negative_memory_allocation
	.type	negative_memory_allocation, @function
negative_memory_allocation:
.LASANPC68:
.LFB68:
	.loc 1 108 0
	.cfi_startproc
.LVL63:
	.loc 1 112 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000c06, %rcx
movl $0x00000c06, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$99, %eax
	ret
	.cfi_endproc
.LFE68:
	.size	negative_memory_allocation, .-negative_memory_allocation
	.section	.text.unlikely
.LCOLDE16:
	.text
.LHOTE16:
	.section	.text.unlikely
.LCOLDB17:
	.text
.LHOTB17:
	.p2align 4,,15
	.globl	use_after_free
	.type	use_after_free, @function
use_after_free:
.LASANPC69:
.LFB69:
	.loc 1 114 0
	.cfi_startproc
.LVL64:
	.loc 1 115 0

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

	cmpl	$10, %edi
	je	.L53

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00004930, %rcx
movl $0x00004930, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	rep ret
	.p2align 4,,10
	.p2align 3
.L53:
.LVL65:
.LBB65:
.LBB66:
	.loc 3 104 0
	xorl	%edi, %edi
.LVL66:
	jmp	puts
.LVL67:
.LBE66:
.LBE65:
	.cfi_endproc
.LFE69:
	.size	use_after_free, .-use_after_free
	.section	.text.unlikely
.LCOLDE17:
	.text
.LHOTE17:
	.globl	__asan_stack_malloc_2
	.section	.rodata.str1.1
.LC18:
	.string	"1 32 80 5 array "
	.section	.text.unlikely
.LCOLDB19:
	.text
.LHOTB19:
	.p2align 4,,15
	.globl	out_of_bounds
	.type	out_of_bounds, @function
out_of_bounds:
.LASANPC70:
.LFB70:
	.loc 1 121 0
	.cfi_startproc
.LVL68:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b67b, %rcx
movl $0x0000b67b, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebx
	subq	$168, %rsp
	.cfi_def_cfa_offset 192
	movl	__asan_option_detect_stack_use_after_return(%rip), %edx
	movq	%rsp, %rax
	movq	%rsp, %rbp
	testl	%edx, %edx
	jne	.L63

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

.LVL69:
.L54:
	.loc 1 121 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000ae7b, %rcx
movl $0x0000ae7b, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rax, %r8
	movslq	%ebx, %rdi
	movq	$1102416563, (%rax)
	shrq	$3, %r8
	movq	$.LC18, 8(%rax)
	movq	$.LASANPC70, 16(%rax)
	movl	$-235802127, 2147450880(%r8)
	movl	$-185335808, 2147450892(%r8)
	movl	$-202116109, 2147450896(%r8)
	movq	%fs:40, %rsi
	movq	%rsi, 152(%rsp)
	xorl	%esi, %esi
	.loc 1 123 0
	cmpq	$19, %rdi
	ja	.L64

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000a273, %rcx
movl $0x0000a273, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leaq	4(,%rdi,4), %rcx
	leaq	32(%rax,%rdi,4), %rsi
	cmpq	$80, %rcx
	ja	.L65

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

.L57:
	.loc 1 121 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000b9f, %rcx
movl $0x00000b9f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	cmpq	%rax, %rbp
	jne	.L66

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000fb7, %rcx
movl $0x00000fb7, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$0, 2147450880(%r8)
	movq	$0, 2147450892(%r8)
.L56:
	.loc 1 124 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00007d2d, %rcx
movl $0x00007d2d, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	152(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L67

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00003382, %rcx
movl $0x00003382, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL70:
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.LVL71:
.L63:
	.cfi_restore_state
	.loc 1 121 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000006b3, %rcx
movl $0x000006b3, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rsp, %rsi
	movl	$160, %edi
	call	__asan_stack_malloc_2
.LVL72:
	jmp	.L54
.L67:
	.loc 1 124 0

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
.LVL73:
.L66:
	.loc 1 121 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000971f, %rcx
movl $0x0000971f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	$1172321806, (%rax)
	movabsq	$-723401728380766731, %rax
	movl	$-168430091, 2147450896(%r8)
	movq	%rax, 2147450880(%r8)
	movq	%rax, 2147450888(%r8)
	jmp	.L56
.L65:
	.loc 1 123 0

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

	addq	%rsi, %rcx
	jc	.L57

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

	movl	$.Lubsan_data30, %edi
	call	__ubsan_handle_type_mismatch_abort
.LVL74:
.L64:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000b9a7, %rcx
movl $0x0000b9a7, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	%rdi, %rsi
	movl	$.Lubsan_data29, %edi
	call	__ubsan_handle_out_of_bounds_abort
.LVL75:
	.cfi_endproc
.LFE70:
	.size	out_of_bounds, .-out_of_bounds
	.section	.text.unlikely
.LCOLDE19:
	.text
.LHOTE19:
	.section	.text.unlikely
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4,,15
	.globl	division_by_zero
	.type	division_by_zero, @function
division_by_zero:
.LASANPC71:
.LFB71:
	.loc 1 126 0
	.cfi_startproc
.LVL76:
	.loc 1 127 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00002c7f, %rcx
movl $0x00002c7f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$100, %eax
	.loc 1 126 0
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 127 0
	subl	%edi, %eax
	jo	.L74

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00001bd0, %rcx
movl $0x00001bd0, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	testl	%eax, %eax
	movl	%eax, %ecx
	je	.L75

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000577f, %rcx
movl $0x0000577f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 127 0 is_stmt 0 discriminator 2
	movl	$2, %eax
	.loc 1 128 0 is_stmt 1 discriminator 2
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	.loc 1 127 0 discriminator 2
	cltd
	idivl	%ecx
	.loc 1 128 0 discriminator 2
	ret
.L74:
	.cfi_restore_state
	.loc 1 127 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00002152, %rcx
movl $0x00002152, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movslq	%edi, %rdx
	movl	$100, %esi
	movl	$.Lubsan_data31, %edi
.LVL77:
	call	__ubsan_handle_sub_overflow_abort
.LVL78:
.L75:
	.loc 1 127 0 is_stmt 0 discriminator 1

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000160b, %rcx
movl $0x0000160b, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__asan_handle_no_return
.LVL79:
	xorl	%edx, %edx
	movl	$2, %esi
	movl	$.Lubsan_data2, %edi
	call	__ubsan_handle_divrem_overflow_abort
.LVL80:
	.cfi_endproc
.LFE71:
	.size	division_by_zero, .-division_by_zero
	.section	.text.unlikely
.LCOLDE20:
	.text
.LHOTE20:
	.section	.text.unlikely
.LCOLDB21:
	.text
.LHOTB21:
	.p2align 4,,15
	.globl	unsigned_int
	.type	unsigned_int, @function
unsigned_int:
.LASANPC72:
.LFB72:
	.loc 1 130 0 is_stmt 1
	.cfi_startproc
.LVL81:
	.loc 1 131 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00001742, %rcx
movl $0x00001742, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	%edi, %eax
	subl	$10, %eax
	jo	.L82

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ab5, %rcx
movl $0x00000ab5, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 133 0
	rep ret
.L82:
	.loc 1 130 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00009157, %rcx
movl $0x00009157, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	pushq	%rax
	.cfi_def_cfa_offset 16
	movslq	%edi, %rsi
	.loc 1 131 0
	movl	$10, %edx
	movl	$.Lubsan_data32, %edi
.LVL82:
	call	__ubsan_handle_sub_overflow_abort
.LVL83:
	.cfi_endproc
.LFE72:
	.size	unsigned_int, .-unsigned_int
	.section	.text.unlikely
.LCOLDE21:
	.text
.LHOTE21:
	.section	.rodata
	.align 32
.LC22:
	.string	"Resukt is %hu + %hu = %hu\n"
	.zero	37
	.section	.text.unlikely
.LCOLDB23:
	.text
.LHOTB23:
	.p2align 4,,15
	.globl	unsigned_overflow
	.type	unsigned_overflow, @function
unsigned_overflow:
.LASANPC73:
.LFB73:
	.loc 1 135 0
	.cfi_startproc
.LVL84:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000eccd, %rcx
movl $0x0000eccd, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 139 0
	leal	-536(%rdi), %ebx
.LVL85:
	.loc 1 135 0
	movl	%edi, %ecx
.LBB67:
.LBB68:
	.loc 3 104 0
	movl	$65000, %edx
	movl	$.LC22, %esi
	movl	$1, %edi
.LVL86:
	movzwl	%bx, %r8d
	xorl	%eax, %eax
	call	__printf_chk
.LVL87:
.LBE68:
.LBE67:
	.loc 1 142 0
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL88:
	ret
	.cfi_endproc
.LFE73:
	.size	unsigned_overflow, .-unsigned_overflow
	.section	.text.unlikely
.LCOLDE23:
	.text
.LHOTE23:
	.section	.rodata
	.align 32
.LC24:
	.string	"turning %d to %d\n"
	.zero	46
	.section	.text.unlikely
.LCOLDB25:
	.text
.LHOTB25:
	.p2align 4,,15
	.globl	truncating_unsigned
	.type	truncating_unsigned, @function
truncating_unsigned:
.LASANPC74:
.LFB74:
	.loc 1 144 0
	.cfi_startproc
.LVL89:
.LBB69:
.LBB70:
	.loc 3 104 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000628, %rcx
movl $0x00000628, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$65535, %ecx
	movl	$2147483647, %edx
	movl	$.LC24, %esi
	movl	$1, %edi
.LVL90:
	xorl	%eax, %eax
	jmp	__printf_chk
.LVL91:
.LBE70:
.LBE69:
	.cfi_endproc
.LFE74:
	.size	truncating_unsigned, .-truncating_unsigned
	.section	.text.unlikely
.LCOLDE25:
	.text
.LHOTE25:
	.section	.rodata
	.align 32
.LC26:
	.string	"%6hu %6hd\n"
	.zero	53
	.section	.text.unlikely
.LCOLDB27:
	.text
.LHOTB27:
	.p2align 4,,15
	.globl	sign_conversion
	.type	sign_conversion, @function
sign_conversion:
.LASANPC75:
.LFB75:
	.loc 1 150 0
	.cfi_startproc
.LVL92:
.LBB71:
.LBB72:
	.loc 3 104 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000628, %rcx
movl $0x00000628, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$32896, %ecx
	movl	$32896, %edx
	movl	$.LC26, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk
.LVL93:
.LBE72:
.LBE71:
	.cfi_endproc
.LFE75:
	.size	sign_conversion, .-sign_conversion
	.section	.text.unlikely
.LCOLDE27:
	.text
.LHOTE27:
	.section	.text.unlikely
.LCOLDB28:
	.text
.LHOTB28:
	.p2align 4,,15
	.globl	double_free
	.type	double_free, @function
double_free:
.LASANPC76:
.LFB76:
	.loc 1 159 0
	.cfi_startproc
.LVL94:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ab5, %rcx
movl $0x00000ab5, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	rep ret
	.cfi_endproc
.LFE76:
	.size	double_free, .-double_free
	.section	.text.unlikely
.LCOLDE28:
	.text
.LHOTE28:
	.section	.rodata
	.align 32
.LC29:
	.string	"vul.c"
	.zero	58
	.data
	.align 32
	.type	.Lubsan_data32, @object
	.size	.Lubsan_data32, 24
.Lubsan_data32:
	.quad	.LC29
	.long	131
	.long	21
	.quad	.Lubsan_type2
	.zero	40
	.align 32
	.type	.Lubsan_data31, @object
	.size	.Lubsan_data31, 24
.Lubsan_data31:
	.quad	.LC29
	.long	127
	.long	16
	.quad	.Lubsan_type2
	.zero	40
	.align 32
	.type	.Lubsan_data30, @object
	.size	.Lubsan_data30, 40
.Lubsan_data30:
	.quad	.LC29
	.long	123
	.long	11
	.quad	.Lubsan_type3
	.quad	0
	.byte	1
	.zero	7
	.zero	56
	.align 32
	.type	.Lubsan_type3, @object
	.size	.Lubsan_type3, 10
.Lubsan_type3:
	.value	-1
	.value	0
	.string	"'int'"
	.zero	54
	.align 32
	.type	.Lubsan_data29, @object
	.size	.Lubsan_data29, 32
.Lubsan_data29:
	.quad	.LC29
	.long	123
	.long	7
	.quad	.Lubsan_type2
	.quad	.Lubsan_type1
	.zero	32
	.align 32
	.type	.Lubsan_type2, @object
	.size	.Lubsan_type2, 15
.Lubsan_type2:
	.value	0
	.value	11
	.string	"'int [20]'"
	.zero	49
	.align 32
	.type	.Lubsan_data21, @object
	.size	.Lubsan_data21, 40
.Lubsan_data21:
	.quad	.LC29
	.long	55
	.long	2
	.quad	0
	.long	0
	.long	0
	.long	2
	.zero	4
	.zero	56
	.align 32
	.type	.Lubsan_data18, @object
	.size	.Lubsan_data18, 40
.Lubsan_data18:
	.quad	.LC29
	.long	48
	.long	5
	.quad	0
	.long	0
	.long	0
	.long	1
	.zero	4
	.zero	56
	.align 32
	.type	.Lubsan_data16, @object
	.size	.Lubsan_data16, 40
.Lubsan_data16:
	.quad	.LC29
	.long	44
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
	.quad	.LC29
	.long	35
	.long	12
	.quad	0
	.long	0
	.long	0
	.long	1
	.zero	4
	.zero	56
	.align 32
	.type	.Lubsan_data7, @object
	.size	.Lubsan_data7, 40
.Lubsan_data7:
	.quad	.LC29
	.long	25
	.long	8
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
	.quad	.LC29
	.long	127
	.long	10
	.quad	.Lubsan_type1
	.zero	40
	.align 32
	.type	.Lubsan_type1, @object
	.size	.Lubsan_type1, 10
.Lubsan_type1:
	.value	0
	.value	11
	.string	"'int'"
	.zero	54
	.align 32
	.type	.Lubsan_data1, @object
	.size	.Lubsan_data1, 24
.Lubsan_data1:
	.quad	.LC29
	.long	35
	.long	10
	.quad	.Lubsan_type0
	.zero	40
	.globl	global_buffer
	.bss
	.align 32
	.type	global_buffer, @object
	.size	global_buffer, 20
global_buffer:
	.zero	64
	.data
	.align 32
	.type	.Lubsan_type0, @object
	.size	.Lubsan_type0, 24
.Lubsan_type0:
	.value	0
	.value	12
	.string	"'long unsigned int'"
	.zero	40
	.align 16
	.type	.LASANLOC1, @object
	.size	.LASANLOC1, 16
.LASANLOC1:
	.quad	.LC29
	.long	11
	.long	6
	.section	.rodata.str1.1
.LC30:
	.string	"*.Lubsan_data32"
.LC31:
	.string	"*.Lubsan_data31"
.LC32:
	.string	"*.Lubsan_data30"
.LC33:
	.string	"*.Lubsan_type3"
.LC34:
	.string	"*.Lubsan_data29"
.LC35:
	.string	"*.Lubsan_type2"
.LC36:
	.string	"*.Lubsan_data21"
.LC37:
	.string	"*.Lubsan_data18"
.LC38:
	.string	"*.Lubsan_data16"
.LC39:
	.string	"*.Lubsan_data11"
.LC40:
	.string	"*.Lubsan_data7"
.LC41:
	.string	"*.Lubsan_data2"
.LC42:
	.string	"*.Lubsan_type1"
.LC43:
	.string	"*.Lubsan_data1"
.LC44:
	.string	"global_buffer"
.LC45:
	.string	"*.Lubsan_type0"
.LC46:
	.string	"*.LC2"
.LC47:
	.string	"*.LC1"
.LC48:
	.string	"*.LC8"
.LC49:
	.string	"*.LC6"
.LC50:
	.string	"*.LC13"
.LC51:
	.string	"*.LC24"
.LC52:
	.string	"*.LC22"
.LC53:
	.string	"*.LC26"
.LC54:
	.string	"*.LC4"
.LC55:
	.string	"*.LC29"
	.data
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 1456
.LASAN0:
	.quad	.Lubsan_data32
	.quad	24
	.quad	64
	.quad	.LC30
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.Lubsan_data31
	.quad	24
	.quad	64
	.quad	.LC31
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.Lubsan_data30
	.quad	40
	.quad	96
	.quad	.LC32
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.Lubsan_type3
	.quad	10
	.quad	64
	.quad	.LC33
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.Lubsan_data29
	.quad	32
	.quad	64
	.quad	.LC34
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.Lubsan_type2
	.quad	15
	.quad	64
	.quad	.LC35
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.Lubsan_data21
	.quad	40
	.quad	96
	.quad	.LC36
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.Lubsan_data18
	.quad	40
	.quad	96
	.quad	.LC37
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.Lubsan_data16
	.quad	40
	.quad	96
	.quad	.LC38
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.Lubsan_data11
	.quad	40
	.quad	96
	.quad	.LC39
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.Lubsan_data7
	.quad	40
	.quad	96
	.quad	.LC40
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.Lubsan_data2
	.quad	24
	.quad	64
	.quad	.LC41
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.Lubsan_type1
	.quad	10
	.quad	64
	.quad	.LC42
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.Lubsan_data1
	.quad	24
	.quad	64
	.quad	.LC43
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	global_buffer
	.quad	20
	.quad	64
	.quad	.LC44
	.quad	.LC29
	.quad	0
	.quad	.LASANLOC1
	.quad	.Lubsan_type0
	.quad	24
	.quad	64
	.quad	.LC45
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.LC2
	.quad	21
	.quad	64
	.quad	.LC46
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.LC1
	.quad	20
	.quad	64
	.quad	.LC47
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.LC8
	.quad	13
	.quad	64
	.quad	.LC48
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.LC6
	.quad	17
	.quad	64
	.quad	.LC49
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.LC13
	.quad	25
	.quad	64
	.quad	.LC50
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.LC24
	.quad	18
	.quad	64
	.quad	.LC51
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.LC22
	.quad	27
	.quad	64
	.quad	.LC52
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.LC26
	.quad	11
	.quad	64
	.quad	.LC53
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.LC4
	.quad	23
	.quad	64
	.quad	.LC54
	.quad	.LC29
	.quad	0
	.quad	0
	.quad	.LC29
	.quad	6
	.quad	64
	.quad	.LC55
	.quad	.LC29
	.quad	0
	.quad	0
	.section	.text.unlikely
.LCOLDB56:
	.section	.text.exit,"ax",@progbits
.LHOTB56:
	.p2align 4,,15
	.type	_GLOBAL__sub_D_00099_0_global_buffer, @function
_GLOBAL__sub_D_00099_0_global_buffer:
.LFB77:
	.loc 1 166 0
	.cfi_startproc
	.loc 1 166 0

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

	movl	$26, %esi
	movl	$.LASAN0, %edi
	jmp	__asan_unregister_globals
.LVL95:
	.cfi_endproc
.LFE77:
	.size	_GLOBAL__sub_D_00099_0_global_buffer, .-_GLOBAL__sub_D_00099_0_global_buffer
	.section	.text.unlikely
.LCOLDE56:
	.section	.text.exit
.LHOTE56:
	.section	.fini_array.00099,"aw"
	.align 8
	.quad	_GLOBAL__sub_D_00099_0_global_buffer
	.section	.text.unlikely
.LCOLDB57:
	.section	.text.startup,"ax",@progbits
.LHOTB57:
	.p2align 4,,15
	.type	_GLOBAL__sub_I_00099_1_global_buffer, @function
_GLOBAL__sub_I_00099_1_global_buffer:
.LFB78:
	.loc 1 166 0
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
	.loc 1 166 0
	call	__asan_init_v4
.LVL96:
	movl	$26, %esi
	movl	$.LASAN0, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__asan_register_globals
.LVL97:
	.cfi_endproc
.LFE78:
	.size	_GLOBAL__sub_I_00099_1_global_buffer, .-_GLOBAL__sub_I_00099_1_global_buffer
	.section	.text.unlikely
.LCOLDE57:
	.section	.text.startup
.LHOTE57:
	.section	.init_array.00099,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_00099_1_global_buffer
	.text
.Letext0:
	.section	.text.unlikely
.Letext_cold0:
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 6 "/usr/include/libio.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "<built-in>"
	.file 9 "/usr/include/string.h"
	.file 10 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xf29
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF108
	.byte	0xc
	.long	.LASF109
	.long	.LASF110
	.long	.Ldebug_ranges0+0xc0
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
	.byte	0x6
	.byte	0xf1
	.long	0x215
	.uleb128 0x8
	.long	.LASF12
	.byte	0x6
	.byte	0xf2
	.long	0x5e
	.byte	0
	.uleb128 0x8
	.long	.LASF13
	.byte	0x6
	.byte	0xf7
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF14
	.byte	0x6
	.byte	0xf8
	.long	0x8b
	.byte	0x10
	.uleb128 0x8
	.long	.LASF15
	.byte	0x6
	.byte	0xf9
	.long	0x8b
	.byte	0x18
	.uleb128 0x8
	.long	.LASF16
	.byte	0x6
	.byte	0xfa
	.long	0x8b
	.byte	0x20
	.uleb128 0x8
	.long	.LASF17
	.byte	0x6
	.byte	0xfb
	.long	0x8b
	.byte	0x28
	.uleb128 0x8
	.long	.LASF18
	.byte	0x6
	.byte	0xfc
	.long	0x8b
	.byte	0x30
	.uleb128 0x8
	.long	.LASF19
	.byte	0x6
	.byte	0xfd
	.long	0x8b
	.byte	0x38
	.uleb128 0x8
	.long	.LASF20
	.byte	0x6
	.byte	0xfe
	.long	0x8b
	.byte	0x40
	.uleb128 0x9
	.long	.LASF21
	.byte	0x6
	.value	0x100
	.long	0x8b
	.byte	0x48
	.uleb128 0x9
	.long	.LASF22
	.byte	0x6
	.value	0x101
	.long	0x8b
	.byte	0x50
	.uleb128 0x9
	.long	.LASF23
	.byte	0x6
	.value	0x102
	.long	0x8b
	.byte	0x58
	.uleb128 0x9
	.long	.LASF24
	.byte	0x6
	.value	0x104
	.long	0x24d
	.byte	0x60
	.uleb128 0x9
	.long	.LASF25
	.byte	0x6
	.value	0x106
	.long	0x253
	.byte	0x68
	.uleb128 0x9
	.long	.LASF26
	.byte	0x6
	.value	0x108
	.long	0x5e
	.byte	0x70
	.uleb128 0x9
	.long	.LASF27
	.byte	0x6
	.value	0x10c
	.long	0x5e
	.byte	0x74
	.uleb128 0x9
	.long	.LASF28
	.byte	0x6
	.value	0x10e
	.long	0x6c
	.byte	0x78
	.uleb128 0x9
	.long	.LASF29
	.byte	0x6
	.value	0x112
	.long	0x42
	.byte	0x80
	.uleb128 0x9
	.long	.LASF30
	.byte	0x6
	.value	0x113
	.long	0x50
	.byte	0x82
	.uleb128 0x9
	.long	.LASF31
	.byte	0x6
	.value	0x114
	.long	0x259
	.byte	0x83
	.uleb128 0x9
	.long	.LASF32
	.byte	0x6
	.value	0x118
	.long	0x269
	.byte	0x88
	.uleb128 0x9
	.long	.LASF33
	.byte	0x6
	.value	0x121
	.long	0x77
	.byte	0x90
	.uleb128 0x9
	.long	.LASF34
	.byte	0x6
	.value	0x129
	.long	0x89
	.byte	0x98
	.uleb128 0x9
	.long	.LASF35
	.byte	0x6
	.value	0x12a
	.long	0x89
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF36
	.byte	0x6
	.value	0x12b
	.long	0x89
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF37
	.byte	0x6
	.value	0x12c
	.long	0x89
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF38
	.byte	0x6
	.value	0x12e
	.long	0x29
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF39
	.byte	0x6
	.value	0x12f
	.long	0x5e
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x6
	.value	0x131
	.long	0x26f
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF111
	.byte	0x6
	.byte	0x96
	.uleb128 0x7
	.long	.LASF42
	.byte	0x18
	.byte	0x6
	.byte	0x9c
	.long	0x24d
	.uleb128 0x8
	.long	.LASF43
	.byte	0x6
	.byte	0x9d
	.long	0x24d
	.byte	0
	.uleb128 0x8
	.long	.LASF44
	.byte	0x6
	.byte	0x9e
	.long	0x253
	.byte	0x8
	.uleb128 0x8
	.long	.LASF45
	.byte	0x6
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
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF46
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF47
	.uleb128 0xe
	.long	.LASF48
	.byte	0x3
	.byte	0x66
	.long	0x5e
	.byte	0x3
	.long	0x2b5
	.uleb128 0xf
	.long	.LASF50
	.byte	0x3
	.byte	0x66
	.long	0x2b5
	.uleb128 0x10
	.byte	0
	.uleb128 0x11
	.long	0x27f
	.uleb128 0xe
	.long	.LASF49
	.byte	0x2
	.byte	0x6c
	.long	0x8b
	.byte	0x3
	.long	0x2e1
	.uleb128 0xf
	.long	.LASF51
	.byte	0x2
	.byte	0x6c
	.long	0x2e1
	.uleb128 0xf
	.long	.LASF52
	.byte	0x2
	.byte	0x6c
	.long	0x2b5
	.byte	0
	.uleb128 0x11
	.long	0x8b
	.uleb128 0x12
	.long	.LASF53
	.byte	0x1
	.byte	0xd
	.quad	.LFB60
	.quad	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.long	0x427
	.uleb128 0x13
	.long	.LASF55
	.byte	0x1
	.byte	0xd
	.long	0x8b
	.long	.LLST0
	.uleb128 0x14
	.long	.LASF61
	.byte	0x1
	.byte	0x11
	.long	0x427
	.uleb128 0x15
	.long	0x2ba
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.byte	0x1
	.byte	0x19
	.long	0x366
	.uleb128 0x16
	.long	0x2d5
	.long	.LLST1
	.uleb128 0x17
	.long	0x2ca
	.uleb128 0x18
	.quad	.LVL3
	.long	0xdcb
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	0x298
	.quad	.LBB37
	.quad	.LBE37-.LBB37
	.byte	0x1
	.byte	0x1a
	.long	0x3b1
	.uleb128 0x16
	.long	0x2a8
	.long	.LLST2
	.uleb128 0x18
	.quad	.LVL4
	.long	0xdda
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
	.quad	.LC1
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	0x298
	.quad	.LBB39
	.quad	.LBE39-.LBB39
	.byte	0x1
	.byte	0x1d
	.long	0x3f1
	.uleb128 0x16
	.long	0x2a8
	.long	.LLST3
	.uleb128 0x18
	.quad	.LVL5
	.long	0xdff
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.byte	0
	.byte	0
	.uleb128 0x1a
	.quad	.LVL10
	.long	0xe0e
	.uleb128 0x1a
	.quad	.LVL11
	.long	0xe17
	.uleb128 0x18
	.quad	.LVL12
	.long	0xe26
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data7
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	0x91
	.long	0x437
	.uleb128 0xc
	.long	0x82
	.byte	0x4
	.byte	0
	.uleb128 0x1b
	.long	.LASF54
	.byte	0x1
	.byte	0x20
	.quad	.LFB61
	.quad	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.long	0x5a6
	.uleb128 0x1c
	.string	"x"
	.byte	0x1
	.byte	0x20
	.long	0x27f
	.long	.LLST4
	.uleb128 0x1d
	.string	"y"
	.byte	0x1
	.byte	0x23
	.long	0x5a6
	.long	.LLST5
	.uleb128 0x1e
	.long	0x298
	.quad	.LBB41
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x22
	.long	0x4aa
	.uleb128 0x16
	.long	0x2a8
	.long	.LLST6
	.uleb128 0x18
	.quad	.LVL16
	.long	0xdff
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	0x2ba
	.quad	.LBB45
	.long	.Ldebug_ranges0+0x30
	.byte	0x1
	.byte	0x24
	.long	0x4ee
	.uleb128 0x16
	.long	0x2d5
	.long	.LLST7
	.uleb128 0x16
	.long	0x2ca
	.long	.LLST8
	.uleb128 0x18
	.quad	.LVL19
	.long	0xe51
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	0x298
	.quad	.LBB49
	.quad	.LBE49-.LBB49
	.byte	0x1
	.byte	0x25
	.long	0x527
	.uleb128 0x16
	.long	0x2a8
	.long	.LLST9
	.uleb128 0x18
	.quad	.LVL20
	.long	0xdff
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL17
	.long	0xe68
	.long	0x53f
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1a
	.quad	.LVL24
	.long	0xe17
	.uleb128 0x1f
	.quad	.LVL25
	.long	0xe26
	.long	0x56b
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data11
	.byte	0
	.uleb128 0x1a
	.quad	.LVL26
	.long	0xe0e
	.uleb128 0x1a
	.quad	.LVL27
	.long	0xe17
	.uleb128 0x18
	.quad	.LVL28
	.long	0xe74
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data1
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	0x91
	.long	0x5b5
	.uleb128 0x20
	.long	0x82
	.byte	0
	.uleb128 0x1b
	.long	.LASF56
	.byte	0x1
	.byte	0x29
	.quad	.LFB62
	.quad	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.long	0x6a6
	.uleb128 0x1c
	.string	"x"
	.byte	0x1
	.byte	0x29
	.long	0x27f
	.long	.LLST10
	.uleb128 0x1d
	.string	"y"
	.byte	0x1
	.byte	0x2f
	.long	0x8b
	.long	.LLST11
	.uleb128 0x15
	.long	0x298
	.quad	.LBB51
	.quad	.LBE51-.LBB51
	.byte	0x1
	.byte	0x2b
	.long	0x62c
	.uleb128 0x16
	.long	0x2a8
	.long	.LLST12
	.uleb128 0x18
	.quad	.LVL31
	.long	0xdff
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.byte	0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL32
	.long	0xe68
	.long	0x644
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1a
	.quad	.LVL33
	.long	0xe99
	.uleb128 0x1a
	.quad	.LVL37
	.long	0xe17
	.uleb128 0x1f
	.quad	.LVL38
	.long	0xe26
	.long	0x67d
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data18
	.byte	0
	.uleb128 0x1a
	.quad	.LVL39
	.long	0xe17
	.uleb128 0x18
	.quad	.LVL40
	.long	0xe26
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data16
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LASF57
	.byte	0x1
	.byte	0x36
	.quad	.LFB63
	.quad	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.long	0x79c
	.uleb128 0x1c
	.string	"x"
	.byte	0x1
	.byte	0x36
	.long	0x8b
	.long	.LLST13
	.uleb128 0x15
	.long	0x2ba
	.quad	.LBB53
	.quad	.LBE53-.LBB53
	.byte	0x1
	.byte	0x37
	.long	0x725
	.uleb128 0x16
	.long	0x2d5
	.long	.LLST14
	.uleb128 0x16
	.long	0x2ca
	.long	.LLST15
	.uleb128 0x18
	.quad	.LVL44
	.long	0xdcb
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	global_buffer
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x44
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	0x298
	.quad	.LBB55
	.long	.Ldebug_ranges0+0x60
	.byte	0x1
	.byte	0x38
	.long	0x773
	.uleb128 0x16
	.long	0x2a8
	.long	.LLST16
	.uleb128 0x21
	.quad	.LVL45
	.long	0xdda
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
	.quad	.LC8
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	global_buffer
	.byte	0
	.byte	0
	.uleb128 0x1a
	.quad	.LVL46
	.long	0xe17
	.uleb128 0x18
	.quad	.LVL47
	.long	0xe26
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data21
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	.LASF58
	.byte	0x1
	.byte	0x3b
	.long	0x5e
	.quad	.LFB64
	.quad	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.long	0x7c9
	.uleb128 0x23
	.string	"a"
	.byte	0x1
	.byte	0x3b
	.long	0x5e
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x22
	.long	.LASF59
	.byte	0x1
	.byte	0x47
	.long	0x5e
	.quad	.LFB65
	.quad	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.long	0x7f6
	.uleb128 0x23
	.string	"a"
	.byte	0x1
	.byte	0x47
	.long	0x5e
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x12
	.long	.LASF60
	.byte	0x1
	.byte	0x53
	.quad	.LFB66
	.quad	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.long	0x8ad
	.uleb128 0x1c
	.string	"a"
	.byte	0x1
	.byte	0x53
	.long	0x5e
	.long	.LLST17
	.uleb128 0x24
	.string	"dp"
	.byte	0x1
	.byte	0x59
	.long	0x8b
	.uleb128 0x1e
	.long	0x298
	.quad	.LBB59
	.long	.Ldebug_ranges0+0x90
	.byte	0x1
	.byte	0x54
	.long	0x866
	.uleb128 0x16
	.long	0x2a8
	.long	.LLST18
	.uleb128 0x18
	.quad	.LVL53
	.long	0xdff
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC13
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	0x298
	.quad	.LBB63
	.quad	.LBE63-.LBB63
	.byte	0x1
	.byte	0x60
	.long	0x89f
	.uleb128 0x16
	.long	0x2a8
	.long	.LLST19
	.uleb128 0x18
	.quad	.LVL56
	.long	0xdff
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 32
	.byte	0
	.byte	0
	.uleb128 0x1a
	.quad	.LVL61
	.long	0xe0e
	.byte	0
	.uleb128 0x25
	.long	.LASF62
	.byte	0x1
	.byte	0x66
	.quad	.LFB67
	.quad	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.long	0x8e4
	.uleb128 0x26
	.string	"a"
	.byte	0x1
	.byte	0x67
	.long	0x8e4
	.uleb128 0x6
	.byte	0xf2
	.long	.Ldebug_info0+2266
	.sleb128 0
	.uleb128 0x24
	.string	"b"
	.byte	0x1
	.byte	0x68
	.long	0x8ea
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x8ea
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF63
	.uleb128 0x27
	.long	.LASF64
	.byte	0x1
	.byte	0x6c
	.long	0x8b
	.quad	.LFB68
	.quad	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.long	0x91d
	.uleb128 0x28
	.string	"c"
	.byte	0x1
	.byte	0x6d
	.long	0x8b
	.byte	0x63
	.byte	0
	.uleb128 0x1b
	.long	.LASF65
	.byte	0x1
	.byte	0x72
	.quad	.LFB69
	.quad	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.long	0x98b
	.uleb128 0x1c
	.string	"a"
	.byte	0x1
	.byte	0x72
	.long	0x5e
	.long	.LLST20
	.uleb128 0x29
	.long	.LASF55
	.byte	0x1
	.byte	0x74
	.long	0x8b
	.byte	0
	.uleb128 0x2a
	.long	0x298
	.quad	.LBB65
	.quad	.LBE65-.LBB65
	.byte	0x1
	.byte	0x76
	.uleb128 0x2b
	.long	0x2a8
	.uleb128 0x6
	.byte	0xf2
	.long	.Ldebug_info0+3680
	.sleb128 0
	.uleb128 0x21
	.quad	.LVL67
	.long	0xdff
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	.LASF66
	.byte	0x1
	.byte	0x79
	.quad	.LFB70
	.quad	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.long	0xa14
	.uleb128 0x1c
	.string	"a"
	.byte	0x1
	.byte	0x79
	.long	0x5e
	.long	.LLST21
	.uleb128 0x14
	.long	.LASF67
	.byte	0x1
	.byte	0x7a
	.long	0xa14
	.uleb128 0x1a
	.quad	.LVL73
	.long	0xe0e
	.uleb128 0x1f
	.quad	.LVL74
	.long	0xec3
	.long	0x9ec
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data30
	.byte	0
	.uleb128 0x18
	.quad	.LVL75
	.long	0xed2
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data29
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x8
	.byte	0x73
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	0x5e
	.long	0xa24
	.uleb128 0xc
	.long	0x82
	.byte	0x13
	.byte	0
	.uleb128 0x22
	.long	.LASF68
	.byte	0x1
	.byte	0x7e
	.long	0x5e
	.quad	.LFB71
	.quad	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.long	0xab7
	.uleb128 0x1c
	.string	"a"
	.byte	0x1
	.byte	0x7e
	.long	0x5e
	.long	.LLST22
	.uleb128 0x1f
	.quad	.LVL78
	.long	0xee1
	.long	0xa84
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data31
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0
	.uleb128 0x1a
	.quad	.LVL79
	.long	0xe17
	.uleb128 0x18
	.quad	.LVL80
	.long	0xef0
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data2
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	.LASF69
	.byte	0x1
	.byte	0x82
	.long	0x49
	.quad	.LFB72
	.quad	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.long	0xb1c
	.uleb128 0x1c
	.string	"a"
	.byte	0x1
	.byte	0x82
	.long	0x5e
	.long	.LLST23
	.uleb128 0x24
	.string	"b"
	.byte	0x1
	.byte	0x83
	.long	0x49
	.uleb128 0x18
	.quad	.LVL83
	.long	0xee1
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data32
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	.LASF70
	.byte	0x1
	.byte	0x87
	.long	0x42
	.quad	.LFB73
	.quad	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.long	0xbbc
	.uleb128 0x1c
	.string	"b"
	.byte	0x1
	.byte	0x87
	.long	0x5e
	.long	.LLST24
	.uleb128 0x2c
	.string	"a"
	.byte	0x1
	.byte	0x88
	.long	0x42
	.sleb128 -536
	.uleb128 0x1d
	.string	"c"
	.byte	0x1
	.byte	0x8a
	.long	0x42
	.long	.LLST25
	.uleb128 0x2a
	.long	0x298
	.quad	.LBB67
	.quad	.LBE67-.LBB67
	.byte	0x1
	.byte	0x8c
	.uleb128 0x16
	.long	0x2a8
	.long	.LLST26
	.uleb128 0x18
	.quad	.LVL87
	.long	0xdda
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
	.quad	.LC22
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa
	.value	0xfde8
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x73
	.sleb128 536
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x6
	.byte	0x73
	.sleb128 0
	.byte	0xa
	.value	0xffff
	.byte	0x1a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LASF71
	.byte	0x1
	.byte	0x90
	.quad	.LFB74
	.quad	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.long	0xc59
	.uleb128 0x1c
	.string	"a"
	.byte	0x1
	.byte	0x90
	.long	0x5e
	.long	.LLST27
	.uleb128 0x2d
	.string	"val"
	.byte	0x1
	.byte	0x91
	.long	0x49
	.long	0x7fffffff
	.uleb128 0x2c
	.string	"ss"
	.byte	0x1
	.byte	0x92
	.long	0x42
	.sleb128 -1
	.uleb128 0x2a
	.long	0x298
	.quad	.LBB69
	.quad	.LBE69-.LBB69
	.byte	0x1
	.byte	0x93
	.uleb128 0x2b
	.long	0x2a8
	.uleb128 0xa
	.byte	0x3
	.quad	.LC24
	.byte	0x9f
	.uleb128 0x21
	.quad	.LVL91
	.long	0xdda
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
	.quad	.LC24
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0xc
	.long	0x7fffffff
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa
	.value	0xffff
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	.LASF72
	.byte	0x1
	.byte	0x96
	.quad	.LFB75
	.quad	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.long	0xce7
	.uleb128 0x2c
	.string	"us"
	.byte	0x1
	.byte	0x97
	.long	0x42
	.sleb128 -32640
	.uleb128 0x2c
	.string	"ss"
	.byte	0x1
	.byte	0x98
	.long	0x57
	.sleb128 -32640
	.uleb128 0x2a
	.long	0x298
	.quad	.LBB71
	.quad	.LBE71-.LBB71
	.byte	0x1
	.byte	0x9a
	.uleb128 0x2b
	.long	0x2a8
	.uleb128 0xa
	.byte	0x3
	.quad	.LC26
	.byte	0x9f
	.uleb128 0x21
	.quad	.LVL93
	.long	0xdda
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
	.quad	.LC26
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa
	.value	0x8080
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa
	.value	0x8080
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LASF73
	.byte	0x1
	.byte	0x9f
	.quad	.LFB76
	.quad	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.long	0xd1b
	.uleb128 0x23
	.string	"i"
	.byte	0x1
	.byte	0x9f
	.long	0x5e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x24
	.string	"ptr"
	.byte	0x1
	.byte	0xa0
	.long	0x8b
	.byte	0
	.uleb128 0x2e
	.long	.LASF74
	.byte	0x7
	.byte	0xa8
	.long	0x253
	.uleb128 0x2e
	.long	.LASF75
	.byte	0x7
	.byte	0xa9
	.long	0x253
	.uleb128 0x2f
	.long	.LASF76
	.byte	0x1
	.byte	0xb
	.long	0x26f
	.uleb128 0x9
	.byte	0x3
	.quad	global_buffer
	.uleb128 0x30
	.long	.LASF77
	.quad	.LFB77
	.quad	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.long	0xd82
	.uleb128 0x21
	.quad	.LVL95
	.long	0xeff
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LASAN0
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	.LASF78
	.quad	.LFB78
	.quad	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.long	0xdcb
	.uleb128 0x1a
	.quad	.LVL96
	.long	0xf0e
	.uleb128 0x21
	.quad	.LVL97
	.long	0xf1d
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LASAN0
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.uleb128 0x31
	.long	.LASF79
	.long	.LASF81
	.byte	0x8
	.byte	0
	.long	.LASF79
	.uleb128 0x32
	.long	.LASF89
	.long	.LASF89
	.byte	0x3
	.byte	0x57
	.uleb128 0x33
	.uleb128 0x18
	.byte	0x9e
	.uleb128 0x16
	.byte	0x73
	.byte	0x74
	.byte	0x72
	.byte	0x63
	.byte	0x70
	.byte	0x79
	.byte	0x28
	.byte	0x29
	.byte	0x20
	.byte	0x65
	.byte	0x78
	.byte	0x65
	.byte	0x63
	.byte	0x75
	.byte	0x74
	.byte	0x65
	.byte	0x64
	.byte	0x2e
	.byte	0x2e
	.byte	0x2e
	.byte	0xa
	.byte	0
	.uleb128 0x31
	.long	.LASF80
	.long	.LASF82
	.byte	0x8
	.byte	0
	.long	.LASF80
	.uleb128 0x34
	.long	.LASF112
	.long	.LASF112
	.uleb128 0x31
	.long	.LASF83
	.long	.LASF84
	.byte	0x8
	.byte	0
	.long	.LASF83
	.uleb128 0x31
	.long	.LASF85
	.long	.LASF86
	.byte	0x8
	.byte	0
	.long	.LASF85
	.uleb128 0x33
	.uleb128 0x1a
	.byte	0x9e
	.uleb128 0x18
	.byte	0x53
	.byte	0x74
	.byte	0x61
	.byte	0x63
	.byte	0x6b
	.byte	0x20
	.byte	0x4f
	.byte	0x76
	.byte	0x65
	.byte	0x72
	.byte	0x66
	.byte	0x6c
	.byte	0x6f
	.byte	0x77
	.byte	0x20
	.byte	0x65
	.byte	0x78
	.byte	0x61
	.byte	0x6d
	.byte	0x70
	.byte	0x6c
	.byte	0x65
	.byte	0xa
	.byte	0
	.uleb128 0x31
	.long	.LASF87
	.long	.LASF88
	.byte	0x8
	.byte	0
	.long	.LASF87
	.uleb128 0x33
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.byte	0x25
	.byte	0x73
	.byte	0xa
	.byte	0
	.uleb128 0x35
	.long	.LASF90
	.long	.LASF90
	.byte	0x9
	.value	0x18a
	.uleb128 0x31
	.long	.LASF91
	.long	.LASF92
	.byte	0x8
	.byte	0
	.long	.LASF91
	.uleb128 0x33
	.uleb128 0x14
	.byte	0x9e
	.uleb128 0x12
	.byte	0x49
	.byte	0x6e
	.byte	0x20
	.byte	0x68
	.byte	0x65
	.byte	0x61
	.byte	0x70
	.byte	0x20
	.byte	0x6f
	.byte	0x76
	.byte	0x65
	.byte	0x72
	.byte	0x66
	.byte	0x6c
	.byte	0x6f
	.byte	0x77
	.byte	0xa
	.byte	0
	.uleb128 0x35
	.long	.LASF93
	.long	.LASF93
	.byte	0xa
	.value	0x1d2
	.uleb128 0x33
	.uleb128 0x1c
	.byte	0x9e
	.uleb128 0x1a
	.byte	0x65
	.byte	0x6e
	.byte	0x74
	.byte	0x65
	.byte	0x72
	.byte	0x65
	.byte	0x64
	.byte	0x20
	.byte	0x64
	.byte	0x61
	.byte	0x6e
	.byte	0x67
	.byte	0x6c
	.byte	0x69
	.byte	0x6e
	.byte	0x67
	.byte	0x20
	.byte	0x70
	.byte	0x6f
	.byte	0x69
	.byte	0x6e
	.byte	0x74
	.byte	0x65
	.byte	0x72
	.byte	0xa
	.byte	0
	.uleb128 0x31
	.long	.LASF94
	.long	.LASF95
	.byte	0x8
	.byte	0
	.long	.LASF94
	.uleb128 0x31
	.long	.LASF96
	.long	.LASF97
	.byte	0x8
	.byte	0
	.long	.LASF96
	.uleb128 0x31
	.long	.LASF98
	.long	.LASF99
	.byte	0x8
	.byte	0
	.long	.LASF98
	.uleb128 0x31
	.long	.LASF100
	.long	.LASF101
	.byte	0x8
	.byte	0
	.long	.LASF100
	.uleb128 0x31
	.long	.LASF102
	.long	.LASF103
	.byte	0x8
	.byte	0
	.long	.LASF102
	.uleb128 0x31
	.long	.LASF104
	.long	.LASF105
	.byte	0x8
	.byte	0
	.long	.LASF104
	.uleb128 0x31
	.long	.LASF106
	.long	.LASF107
	.byte	0x8
	.byte	0
	.long	.LASF106
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
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x5
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2c
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
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x33
	.uleb128 0x36
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x34
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
	.uleb128 0x35
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0
	.quad	.LVL1
	.value	0x1
	.byte	0x55
	.quad	.LVL1
	.quad	.LVL6
	.value	0x1
	.byte	0x5c
	.quad	.LVL6
	.quad	.LVL7
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL7
	.quad	.LVL8
	.value	0x1
	.byte	0x55
	.quad	.LVL8
	.quad	.LFE60
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL2
	.quad	.LVL3
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL3
	.quad	.LVL4
	.value	0xa
	.byte	0x3
	.quad	.LC1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL4
	.quad	.LVL5
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+3557
	.sleb128 0
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL13
	.quad	.LVL14
	.value	0x1
	.byte	0x55
	.quad	.LVL14
	.quad	.LVL21
	.value	0x1
	.byte	0x53
	.quad	.LVL21
	.quad	.LVL23
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL23
	.quad	.LFE61
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL18
	.quad	.LVL22
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL25
	.quad	.LVL26
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL15
	.quad	.LVL16
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+3637
	.sleb128 0
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL18
	.quad	.LVL19
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL18
	.quad	.LVL19
	.value	0x1
	.byte	0x57
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL19
	.quad	.LVL20
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+3680
	.sleb128 0
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL29
	.quad	.LVL30
	.value	0x1
	.byte	0x55
	.quad	.LVL30
	.quad	.LVL35
	.value	0x1
	.byte	0x53
	.quad	.LVL35
	.quad	.LVL36
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL36
	.quad	.LFE62
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL33
	.quad	.LVL34
	.value	0x1
	.byte	0x50
	.quad	.LVL36
	.quad	.LVL37-1
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL29
	.quad	.LVL31
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+3715
	.sleb128 0
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL41
	.quad	.LVL43
	.value	0x1
	.byte	0x55
	.quad	.LVL43
	.quad	.LVL44-1
	.value	0x1
	.byte	0x54
	.quad	.LVL44-1
	.quad	.LVL45
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL45
	.quad	.LVL46-1
	.value	0x1
	.byte	0x55
	.quad	.LVL46-1
	.quad	.LFE63
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL42
	.quad	.LVL43
	.value	0x1
	.byte	0x55
	.quad	.LVL43
	.quad	.LVL44-1
	.value	0x1
	.byte	0x54
	.quad	.LVL44-1
	.quad	.LVL44
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL42
	.quad	.LVL44
	.value	0xa
	.byte	0x3
	.quad	global_buffer
	.byte	0x9f
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL44
	.quad	.LVL45
	.value	0xa
	.byte	0x3
	.quad	.LC8
	.byte	0x9f
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL50
	.quad	.LVL51
	.value	0x1
	.byte	0x55
	.quad	.LVL51
	.quad	.LVL54
	.value	0x1
	.byte	0x5d
	.quad	.LVL54
	.quad	.LVL55
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL55
	.quad	.LVL58
	.value	0x1
	.byte	0x5d
	.quad	.LVL58
	.quad	.LVL59
	.value	0x1
	.byte	0x55
	.quad	.LVL59
	.quad	.LFE66
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL52
	.quad	.LVL53
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+3749
	.sleb128 0
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL55
	.quad	.LVL57
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+3680
	.sleb128 0
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL64
	.quad	.LVL66
	.value	0x1
	.byte	0x55
	.quad	.LVL66
	.quad	.LFE69
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL68
	.quad	.LVL69
	.value	0x1
	.byte	0x55
	.quad	.LVL69
	.quad	.LVL70
	.value	0x1
	.byte	0x53
	.quad	.LVL70
	.quad	.LVL71
	.value	0x1
	.byte	0x55
	.quad	.LVL71
	.quad	.LFE70
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL76
	.quad	.LVL77
	.value	0x1
	.byte	0x55
	.quad	.LVL77
	.quad	.LVL78-1
	.value	0x1
	.byte	0x51
	.quad	.LVL78-1
	.quad	.LVL78
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL78
	.quad	.LVL79-1
	.value	0x1
	.byte	0x55
	.quad	.LVL79-1
	.quad	.LFE71
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL81
	.quad	.LVL82
	.value	0x1
	.byte	0x55
	.quad	.LVL82
	.quad	.LVL83-1
	.value	0x1
	.byte	0x54
	.quad	.LVL83-1
	.quad	.LFE72
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL84
	.quad	.LVL86
	.value	0x1
	.byte	0x55
	.quad	.LVL86
	.quad	.LVL87-1
	.value	0x1
	.byte	0x52
	.quad	.LVL87-1
	.quad	.LVL88
	.value	0x4
	.byte	0x73
	.sleb128 536
	.byte	0x9f
	.quad	.LVL88
	.quad	.LFE73
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL84
	.quad	.LVL85
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL85
	.quad	.LVL88
	.value	0x1
	.byte	0x53
	.quad	.LVL88
	.quad	.LFE73
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL85
	.quad	.LVL87
	.value	0xa
	.byte	0x3
	.quad	.LC22
	.byte	0x9f
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL89
	.quad	.LVL90
	.value	0x1
	.byte	0x55
	.quad	.LVL90
	.quad	.LFE74
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
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
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB77
	.quad	.LFE77-.LFB77
	.quad	.LFB78
	.quad	.LFE78-.LFB78
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB41
	.quad	.LBE41
	.quad	.LBB44
	.quad	.LBE44
	.quad	0
	.quad	0
	.quad	.LBB45
	.quad	.LBE45
	.quad	.LBB48
	.quad	.LBE48
	.quad	0
	.quad	0
	.quad	.LBB55
	.quad	.LBE55
	.quad	.LBB58
	.quad	.LBE58
	.quad	0
	.quad	0
	.quad	.LBB59
	.quad	.LBE59
	.quad	.LBB62
	.quad	.LBE62
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB77
	.quad	.LFE77
	.quad	.LFB78
	.quad	.LFE78
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF48:
	.string	"printf"
.LASF8:
	.string	"__off_t"
.LASF13:
	.string	"_IO_read_ptr"
.LASF93:
	.string	"malloc"
.LASF25:
	.string	"_chain"
.LASF7:
	.string	"size_t"
.LASF31:
	.string	"_shortbuf"
.LASF100:
	.string	"__ubsan_handle_divrem_overflow_abort"
.LASF19:
	.string	"_IO_buf_base"
.LASF47:
	.string	"long long unsigned int"
.LASF52:
	.string	"__src"
.LASF72:
	.string	"sign_conversion"
.LASF105:
	.string	"__builtin___asan_init_v4"
.LASF107:
	.string	"__builtin___asan_register_globals"
.LASF91:
	.string	"__ubsan_handle_vla_bound_not_positive_abort"
.LASF46:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF55:
	.string	"buff"
.LASF84:
	.string	"__builtin___asan_handle_no_return"
.LASF26:
	.string	"_fileno"
.LASF79:
	.string	"__strcpy_chk"
.LASF14:
	.string	"_IO_read_end"
.LASF70:
	.string	"unsigned_overflow"
.LASF76:
	.string	"global_buffer"
.LASF6:
	.string	"long int"
.LASF66:
	.string	"out_of_bounds"
.LASF12:
	.string	"_flags"
.LASF20:
	.string	"_IO_buf_end"
.LASF29:
	.string	"_cur_column"
.LASF97:
	.string	"__builtin___ubsan_handle_out_of_bounds_abort"
.LASF89:
	.string	"__printf_chk"
.LASF28:
	.string	"_old_offset"
.LASF33:
	.string	"_offset"
.LASF67:
	.string	"array"
.LASF81:
	.string	"__builtin___strcpy_chk"
.LASF42:
	.string	"_IO_marker"
.LASF74:
	.string	"stdin"
.LASF106:
	.string	"__asan_register_globals"
.LASF3:
	.string	"unsigned int"
.LASF90:
	.string	"strlen"
.LASF0:
	.string	"long unsigned int"
.LASF73:
	.string	"double_free"
.LASF83:
	.string	"__asan_handle_no_return"
.LASF17:
	.string	"_IO_write_ptr"
.LASF108:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -g -O0 -O3 -fsanitize=address,undefined -fno-sanitize-recover=undefined -funroll-loops -fstack-protector-strong"
.LASF68:
	.string	"division_by_zero"
.LASF2:
	.string	"short unsigned int"
.LASF69:
	.string	"unsigned_int"
.LASF21:
	.string	"_IO_save_base"
.LASF49:
	.string	"strcpy"
.LASF88:
	.string	"__builtin_memcpy"
.LASF32:
	.string	"_lock"
.LASF27:
	.string	"_flags2"
.LASF39:
	.string	"_mode"
.LASF82:
	.string	"__builtin_puts"
.LASF75:
	.string	"stdout"
.LASF99:
	.string	"__builtin___ubsan_handle_sub_overflow_abort"
.LASF86:
	.string	"__builtin___ubsan_handle_nonnull_arg_abort"
.LASF101:
	.string	"__builtin___ubsan_handle_divrem_overflow_abort"
.LASF80:
	.string	"puts"
.LASF10:
	.string	"sizetype"
.LASF64:
	.string	"negative_memory_allocation"
.LASF71:
	.string	"truncating_unsigned"
.LASF78:
	.string	"_GLOBAL__sub_I_00099_1_global_buffer"
.LASF85:
	.string	"__ubsan_handle_nonnull_arg_abort"
.LASF18:
	.string	"_IO_write_end"
.LASF51:
	.string	"__dest"
.LASF62:
	.string	"memory_leak"
.LASF111:
	.string	"_IO_lock_t"
.LASF41:
	.string	"_IO_FILE"
.LASF63:
	.string	"float"
.LASF45:
	.string	"_pos"
.LASF54:
	.string	"stack_overflow"
.LASF24:
	.string	"_markers"
.LASF57:
	.string	"global_buffer_overflow"
.LASF104:
	.string	"__asan_init_v4"
.LASF1:
	.string	"unsigned char"
.LASF5:
	.string	"short int"
.LASF30:
	.string	"_vtable_offset"
.LASF56:
	.string	"heap_overflow"
.LASF110:
	.string	"/home/francis/Documents/ThesisWork/Instrumentation"
.LASF102:
	.string	"__asan_unregister_globals"
.LASF98:
	.string	"__ubsan_handle_sub_overflow_abort"
.LASF11:
	.string	"char"
.LASF109:
	.string	"vul.c"
.LASF96:
	.string	"__ubsan_handle_out_of_bounds_abort"
.LASF112:
	.string	"__stack_chk_fail"
.LASF61:
	.string	"buffer"
.LASF60:
	.string	"dangling_pointer"
.LASF43:
	.string	"_next"
.LASF9:
	.string	"__off64_t"
.LASF59:
	.string	"integer_underflow"
.LASF15:
	.string	"_IO_read_base"
.LASF87:
	.string	"memcpy"
.LASF23:
	.string	"_IO_save_end"
.LASF50:
	.string	"__fmt"
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
.LASF40:
	.string	"_unused2"
.LASF53:
	.string	"buffer_overflow"
.LASF94:
	.string	"__ubsan_handle_type_mismatch_abort"
.LASF22:
	.string	"_IO_backup_base"
.LASF103:
	.string	"__builtin___asan_unregister_globals"
.LASF77:
	.string	"_GLOBAL__sub_D_00099_0_global_buffer"
.LASF92:
	.string	"__builtin___ubsan_handle_vla_bound_not_positive_abort"
.LASF58:
	.string	"integer_overflow"
.LASF65:
	.string	"use_after_free"
.LASF16:
	.string	"_IO_write_base"
.LASF95:
	.string	"__builtin___ubsan_handle_type_mismatch_abort"
.LASF44:
	.string	"_sbuf"
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
     t