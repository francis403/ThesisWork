	.file	"simple_program.c"
	.text
.Ltext0:
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.text
	.globl	add0
	.type	add0, @function
add0:
.LASANPC71:
.LFB71:
	.file 1 "./simple_program.c"
	.loc 1 10 0
	.cfi_startproc
	.loc 1 12 0
	movl	$15, %eax
	ret
	.cfi_endproc
.LFE71:
	.size	add0, .-add0
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	add
	.type	add, @function
add:
.LASANPC77:
.LFB77:
	.cfi_startproc
	testb	$1, %dil
	movl	%edi, %eax
	jne	.L9

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000089c, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	addl	$4, %eax
	jo	.L11

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00003907, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.L9:
	rep ret
.L11:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movslq	%edi, %rsi
	movl	$4, %edx
	movl	$.Lubsan_data13, %edi
	call	__ubsan_handle_add_overflow_abort
	.cfi_endproc
.LFE77:
	.size	add, .-add
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	add2
	.type	add2, @function
add2:
.LASANPC73:
.LFB73:
	.loc 1 20 0
	.cfi_startproc
.LVL0:
	.loc 1 21 0
	testb	$1, %dil
	.loc 1 22 0
	movl	%edi, %eax
	.loc 1 21 0
	jne	.L19

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000089c, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 22 0
	addl	$4, %eax
	jo	.L20

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00003907, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.L19:
	.loc 1 24 0
	rep ret
.L20:
	.loc 1 20 0
	pushq	%rax
	.cfi_def_cfa_offset 16
	movslq	%edi, %rsi
	.loc 1 22 0
	movl	$4, %edx
	movl	$.Lubsan_data14, %edi
.LVL1:
	call	__ubsan_handle_add_overflow_abort
.LVL2:
	.cfi_endproc
.LFE73:
	.size	add2, .-add2
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4,,15
	.globl	add3
	.type	add3, @function
add3:
.LASANPC74:
.LFB74:
	.loc 1 30 0
	.cfi_startproc
.LVL3:
	.loc 1 31 0
	movl	%edi, %eax
	movl	$1431655766, %edx
	movl	%edi, %ecx
	imull	%edx
	sarl	$31, %ecx
.LBB38:
.LBB39:
	.loc 1 22 0
	movl	%edi, %eax
.LBE39:
.LBE38:
	.loc 1 31 0
	subl	%ecx, %edx
	leal	(%rdx,%rdx,2), %esi
	cmpl	%esi, %edi
	jne	.L25

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ed3, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LVL4:
.LBB42:
.LBB40:
	.loc 1 21 0
	testb	$1, %dil
	jne	.L29

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000089c, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 22 0
	addl	$4, %eax
	jo	.L30

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000f879, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.L29:
.LBE40:
.LBE42:
	.loc 1 35 0
	rep ret
.LVL5:
	.p2align 4,,10
	.p2align 3
.L25:
	rep ret
.LVL6:
.L30:
	.loc 1 30 0
	pushq	%rax
	.cfi_def_cfa_offset 16
	movslq	%edi, %rsi
.LBB43:
.LBB41:
	.loc 1 22 0
	movl	$4, %edx
	movl	$.Lubsan_data15, %edi
.LVL7:
	call	__ubsan_handle_add_overflow_abort
.LVL8:
.LBE41:
.LBE43:
	.cfi_endproc
.LFE74:
	.size	add3, .-add3
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.globl	__asan_stack_malloc_1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"1 32 4 7 decider "
	.section	.rodata
	.align 32
.LC5:
	.string	"Decider = "
	.zero	53
	.align 32
.LC6:
	.string	"%d"
	.zero	61
	.align 32
.LC7:
	.string	"This is what happens when the condition is true"
	.zero	48
	.align 32
.LC8:
	.string	"add %d + 4 = %d\n"
	.zero	47
	.align 32
.LC9:
	.string	"This is what happens when the condition is false"
	.zero	47
	.align 32
.LC10:
	.string	"add2 %d + 4 = %d\n"
	.zero	46
	.align 32
.LC11:
	.string	"%d\n"
	.zero	60
	.align 32
.LC12:
	.string "This, amazingly, always happens"
	.zero	44
	.section	.text.unlikely
.LCOLDB13:
	.section	.text.startup,"ax",@progbits
.LHOTB13:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LASANPC75:
.LFB75:
	.loc 1 38 0
	.cfi_startproc
.LVL9:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
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
	movq	%rsp, %r13
	testl	%eax, %eax
	jne	.L49

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000e3cf, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LVL10:
.L31:
	.loc 1 38 0
	movq	%rbx, %rbp
	movq	$1102416563, (%rbx)
	movq	$.LC4, 8(%rbx)
	shrq	$3, %rbp
	movq	$.LASANPC75, 16(%rbx)
.LBB44:
.LBB45:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 104 0
	movl	$.LC5, %esi
.LBE45:
.LBE44:
	.loc 1 38 0
	movl	$-235802127, 2147450880(%rbp)
	movl	$-185273340, 2147450884(%rbp)
.LBB48:
.LBB46:
	.loc 2 104 0
	movl	$1, %edi
.LBE46:
.LBE48:
	.loc 1 38 0
	movl	$-202116109, 2147450888(%rbp)
	leaq	96(%rbx), %r12
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
.LVL11:
.LBB49:
.LBB47:
	.loc 2 104 0
	call	__printf_chk
.LVL12:
.LBE47:
.LBE49:
	.loc 1 43 0
	leaq	32(%rbx), %rsi
	xorl	%eax, %eax
	movl	$.LC6, %edi
	call	__isoc99_scanf
.LVL13:
	.loc 1 44 0
	cmpl	$5, -64(%r12)
	jle	.L35

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00005023, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LVL14:
.LBB50:
.LBB51:
	.loc 2 104 0
	movl	$.LC7, %edi
	call	puts
.LVL15:
.LBE51:
.LBE50:
	.loc 1 46 0
	movl	-64(%r12), %edx
.LVL16:
.LBB52:
.LBB53:
	.loc 1 15 0
	testb	$1, %dl
	.loc 1 16 0
	movl	%edx, %ecx
	.loc 1 15 0
	jne	.L36

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000089c, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 16 0
	addl	$100, %ecx
	jo	.L50

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000264b, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.L36:
.LVL17:
.LBE53:
.LBE52:
.LBB55:
.LBB56:
	.loc 2 104 0
	movl	$.LC8, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.LVL18:
.L39:
.LBE56:
.LBE55:
.LBB57:
.LBB58:
	movl	$451, %edx
	movl	$.LC11, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.LVL19:
.LBE58:
.LBE57:
.LBB59:
.LBB60:
	movl	$.LC12, %edi
	call	puts
.LVL20:
.LBE60:
.LBE59:
	.loc 1 38 0
	cmpq	%rbx, %r13
	jne	.L51

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000ffa5, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	$0, 2147450880(%rbp)
	movl	$0, 2147450888(%rbp)
.L33:
	.loc 1 59 0
	xorl	%eax, %eax
	movq	88(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L52

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000029aa, %rcx
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
	ret
.L35:
	.cfi_restore_state
.LVL21:
.LBB61:
.LBB62:
	.loc 2 104 0
	movl	$.LC9, %edi
	call	puts
.LVL22:
.LBE62:
.LBE61:
	.loc 1 50 0
	movl	-64(%r12), %edx
.LVL23:
.LBB63:
.LBB64:
	.loc 1 21 0
	testb	$1, %dl
	.loc 1 22 0
	movl	%edx, %ecx
	.loc 1 21 0
	jne	.L40

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000089c, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 22 0
	addl	$100, %ecx
	jo	.L53

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000015dd, %rcx
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.L40:
.LVL24:
.LBE64:
.LBE63:
.LBB66:
.LBB67:
	.loc 2 104 0
	movl	$.LC10, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.LVL25:
	jmp	.L39
.LVL26:
.L53:
.LBE67:
.LBE66:
.LBB68:
.LBB65:
	.loc 1 22 0
	movslq	%edx, %rsi
	movl	$.Lubsan_data17, %edi
	movl	$4, %edx
.LVL27:
	call	__ubsan_handle_add_overflow_abort
.LVL28:
.L50:
.LBE65:
.LBE68:
.LBB69:
.LBB54:
	.loc 1 16 0
	movslq	%edx, %rsi
	movl	$.Lubsan_data16, %edi
	movl	$4, %edx
.LVL29:
	call	__ubsan_handle_add_overflow_abort
.LVL30:
.L51:
.LBE54:
.LBE69:
	.loc 1 38 0
	movabsq	$-723401728380766731, %rdx
	movq	$1172321806, (%rbx)
	movl	$-168430091, 2147450888(%rbp)
	movq	%rdx, 2147450880(%rbp)
	jmp	.L33
.LVL31:
.L49:
	movq	%rsp, %rsi
.LVL32:
	movl	$96, %edi
.LVL33:
	call	__asan_stack_malloc_1
.LVL34:
	movq	%rax, %rbx
	jmp	.L31
.L52:
	.loc 1 59 0
	call	__stack_chk_fail
.LVL35:
	.cfi_endproc
.LFE75:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE13:
	.section	.text.startup
.LHOTE13:
	.section	.rodata
	.align 32
.LC14:
	.string	"./simple_program.c"
	.zero	45
	.data
	.align 32
	.type	.Lubsan_data17, @object
	.size	.Lubsan_data17, 24
.Lubsan_data17:
	.quad	.LC14
	.long	22
	.long	10
	.quad	.Lubsan_type2
	.zero	40
	.align 32
	.type	.Lubsan_data16, @object
	.size	.Lubsan_data16, 24
.Lubsan_data16:
	.quad	.LC14
	.long	16
	.long	10
	.quad	.Lubsan_type2
	.zero	40
	.align 32
	.type	.Lubsan_data15, @object
	.size	.Lubsan_data15, 24
.Lubsan_data15:
	.quad	.LC14
	.long	22
	.long	10
	.quad	.Lubsan_type2
	.zero	40
	.align 32
	.type	.Lubsan_data14, @object
	.size	.Lubsan_data14, 24
.Lubsan_data14:
	.quad	.LC14
	.long	22
	.long	10
	.quad	.Lubsan_type2
	.zero	40
	.align 32
	.type	.Lubsan_data13, @object
	.size	.Lubsan_data13, 24
.Lubsan_data13:
	.quad	.LC14
	.long	22
	.long	10
	.quad	.Lubsan_type2
	.zero	40
	.align 32
	.type	.Lubsan_type2, @object
	.size	.Lubsan_type2, 10
.Lubsan_type2:
	.value	0
	.value	11
	.string	"'int'"
	.zero	54
	.globl	MAX_LINE
	.align 32
	.type	MAX_LINE, @object
	.size	MAX_LINE, 4
MAX_LINE:
	.long	150
	.zero	60
	.align 16
	.type	.LASANLOC1, @object
	.size	.LASANLOC1, 16
.LASANLOC1:
	.quad	.LC14
	.long	7
	.long	5
	.section	.rodata.str1.1
.LC15:
	.string	"*.Lubsan_data17"
.LC16:
	.string	"*.Lubsan_data16"
.LC17:
	.string	"*.Lubsan_data15"
.LC18:
	.string	"*.Lubsan_data14"
.LC19:
	.string	"*.Lubsan_data13"
.LC20:
	.string	"*.Lubsan_type2"
.LC21:
	.string	"MAX_LINE"
.LC22:
	.string	"*.LC11"
.LC23:
	.string	"*.LC8"
.LC24:
	.string	"*.LC5"
.LC25:
	.string	"*.LC7"
.LC26:
	.string	"*.LC12"
.LC27:
	.string	"*.LC9"
.LC28:
	.string	"*.LC6"
.LC29:
	.string	"*.LC10"
.LC30:
	.string	"*.LC14"
	.data
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 896
.LASAN0:
	.quad	.Lubsan_data17
	.quad	24
	.quad	64
	.quad	.LC15
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	.Lubsan_data16
	.quad	24
	.quad	64
	.quad	.LC16
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	.Lubsan_data15
	.quad	24
	.quad	64
	.quad	.LC17
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	.Lubsan_data14
	.quad	24
	.quad	64
	.quad	.LC18
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	.Lubsan_data13
	.quad	24
	.quad	64
	.quad	.LC19
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	.Lubsan_type2
	.quad	10
	.quad	64
	.quad	.LC20
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	MAX_LINE
	.quad	4
	.quad	64
	.quad	.LC21
	.quad	.LC14
	.quad	0
	.quad	.LASANLOC1
	.quad	.LC11
	.quad	4
	.quad	64
	.quad	.LC22
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	.LC8
	.quad	17
	.quad	64
	.quad	.LC23
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	.LC5
	.quad	11
	.quad	64
	.quad	.LC24
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	.LC7
	.quad	48
	.quad	96
	.quad	.LC25
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	.LC12
	.quad	20
	.quad	64
	.quad	.LC26
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	.LC9
	.quad	49
	.quad	96
	.quad	.LC27
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	.LC6
	.quad	3
	.quad	64
	.quad	.LC28
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	.LC10
	.quad	18
	.quad	64
	.quad	.LC29
	.quad	.LC14
	.quad	0
	.quad	0
	.quad	.LC14
	.quad	19
	.quad	64
	.quad	.LC30
	.quad	.LC14
	.quad	0
	.quad	0
	.section	.text.unlikely
.LCOLDB31:
	.section	.text.exit,"ax",@progbits
.LHOTB31:
	.p2align 4,,15
	.type	_GLOBAL__sub_D_00099_0_MAX_LINE, @function
_GLOBAL__sub_D_00099_0_MAX_LINE:
.LFB78:
	.loc 1 59 0
	.cfi_startproc
	.loc 1 59 0
	movl	$16, %esi
	movl	$.LASAN0, %edi
	jmp	__asan_unregister_globals
.LVL36:
	.cfi_endproc
.LFE78:
	.size	_GLOBAL__sub_D_00099_0_MAX_LINE, .-_GLOBAL__sub_D_00099_0_MAX_LINE
	.section	.text.unlikely
.LCOLDE31:
	.section	.text.exit
.LHOTE31:
	.section	.fini_array.00099,"aw"
	.align 8
	.quad	_GLOBAL__sub_D_00099_0_MAX_LINE
	.section	.text.unlikely
.LCOLDB32:
	.section	.text.startup
.LHOTB32:
	.p2align 4,,15
	.type	_GLOBAL__sub_I_00099_1_MAX_LINE, @function
_GLOBAL__sub_I_00099_1_MAX_LINE:
.LFB79:
	.loc 1 59 0
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 59 0
	call	__asan_init_v4
.LVL37:
	movl	$16, %esi
	movl	$.LASAN0, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__asan_register_globals
.LVL38:
	.cfi_endproc
.LFE79:
	.size	_GLOBAL__sub_I_00099_1_MAX_LINE, .-_GLOBAL__sub_I_00099_1_MAX_LINE
	.section	.text.unlikely
.LCOLDE32:
	.section	.text.startup
.LHOTE32:
	.section	.init_array.00099,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_00099_1_MAX_LINE
	.text
.Letext0:
	.section	.text.unlikely
.Letext_cold0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x858
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF71
	.byte	0xc
	.long	.LASF72
	.long	.LASF73
	.long	.Ldebug_ranges0+0xe0
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
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x6
	.byte	0x8
	.long	0xac
	.uleb128 0x7
	.long	0x91
	.uleb128 0x8
	.long	.LASF43
	.byte	0xd8
	.byte	0x5
	.byte	0xf1
	.long	0x22e
	.uleb128 0x9
	.long	.LASF14
	.byte	0x5
	.byte	0xf2
	.long	0x3b
	.byte	0
	.uleb128 0x9
	.long	.LASF15
	.byte	0x5
	.byte	0xf7
	.long	0x8b
	.byte	0x8
	.uleb128 0x9
	.long	.LASF16
	.byte	0x5
	.byte	0xf8
	.long	0x8b
	.byte	0x10
	.uleb128 0x9
	.long	.LASF17
	.byte	0x5
	.byte	0xf9
	.long	0x8b
	.byte	0x18
	.uleb128 0x9
	.long	.LASF18
	.byte	0x5
	.byte	0xfa
	.long	0x8b
	.byte	0x20
	.uleb128 0x9
	.long	.LASF19
	.byte	0x5
	.byte	0xfb
	.long	0x8b
	.byte	0x28
	.uleb128 0x9
	.long	.LASF20
	.byte	0x5
	.byte	0xfc
	.long	0x8b
	.byte	0x30
	.uleb128 0x9
	.long	.LASF21
	.byte	0x5
	.byte	0xfd
	.long	0x8b
	.byte	0x38
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.byte	0xfe
	.long	0x8b
	.byte	0x40
	.uleb128 0xa
	.long	.LASF23
	.byte	0x5
	.value	0x100
	.long	0x8b
	.byte	0x48
	.uleb128 0xa
	.long	.LASF24
	.byte	0x5
	.value	0x101
	.long	0x8b
	.byte	0x50
	.uleb128 0xa
	.long	.LASF25
	.byte	0x5
	.value	0x102
	.long	0x8b
	.byte	0x58
	.uleb128 0xa
	.long	.LASF26
	.byte	0x5
	.value	0x104
	.long	0x266
	.byte	0x60
	.uleb128 0xa
	.long	.LASF27
	.byte	0x5
	.value	0x106
	.long	0x26c
	.byte	0x68
	.uleb128 0xa
	.long	.LASF28
	.byte	0x5
	.value	0x108
	.long	0x3b
	.byte	0x70
	.uleb128 0xa
	.long	.LASF29
	.byte	0x5
	.value	0x10c
	.long	0x3b
	.byte	0x74
	.uleb128 0xa
	.long	.LASF30
	.byte	0x5
	.value	0x10e
	.long	0x6c
	.byte	0x78
	.uleb128 0xa
	.long	.LASF31
	.byte	0x5
	.value	0x112
	.long	0x50
	.byte	0x80
	.uleb128 0xa
	.long	.LASF32
	.byte	0x5
	.value	0x113
	.long	0x57
	.byte	0x82
	.uleb128 0xa
	.long	.LASF33
	.byte	0x5
	.value	0x114
	.long	0x272
	.byte	0x83
	.uleb128 0xa
	.long	.LASF34
	.byte	0x5
	.value	0x118
	.long	0x282
	.byte	0x88
	.uleb128 0xa
	.long	.LASF35
	.byte	0x5
	.value	0x121
	.long	0x77
	.byte	0x90
	.uleb128 0xa
	.long	.LASF36
	.byte	0x5
	.value	0x129
	.long	0x89
	.byte	0x98
	.uleb128 0xa
	.long	.LASF37
	.byte	0x5
	.value	0x12a
	.long	0x89
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF38
	.byte	0x5
	.value	0x12b
	.long	0x89
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF39
	.byte	0x5
	.value	0x12c
	.long	0x89
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF40
	.byte	0x5
	.value	0x12e
	.long	0x29
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF41
	.byte	0x5
	.value	0x12f
	.long	0x3b
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF42
	.byte	0x5
	.value	0x131
	.long	0x288
	.byte	0xc4
	.byte	0
	.uleb128 0xb
	.long	.LASF74
	.byte	0x5
	.byte	0x96
	.uleb128 0x8
	.long	.LASF44
	.byte	0x18
	.byte	0x5
	.byte	0x9c
	.long	0x266
	.uleb128 0x9
	.long	.LASF45
	.byte	0x5
	.byte	0x9d
	.long	0x266
	.byte	0
	.uleb128 0x9
	.long	.LASF46
	.byte	0x5
	.byte	0x9e
	.long	0x26c
	.byte	0x8
	.uleb128 0x9
	.long	.LASF47
	.byte	0x5
	.byte	0xa2
	.long	0x3b
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x235
	.uleb128 0x6
	.byte	0x8
	.long	0xb1
	.uleb128 0xc
	.long	0x91
	.long	0x282
	.uleb128 0xd
	.long	0x82
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22e
	.uleb128 0xc
	.long	0x91
	.long	0x298
	.uleb128 0xd
	.long	0x82
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF49
	.byte	0x1
	.byte	0x14
	.long	0x3b
	.byte	0x1
	.long	0x2b2
	.uleb128 0xf
	.string	"b"
	.byte	0x1
	.byte	0x14
	.long	0x3b
	.byte	0
	.uleb128 0x10
	.long	.LASF75
	.byte	0x2
	.byte	0x66
	.long	0x3b
	.byte	0x3
	.long	0x2cf
	.uleb128 0x11
	.long	.LASF48
	.byte	0x2
	.byte	0x66
	.long	0x2cf
	.uleb128 0x12
	.byte	0
	.uleb128 0x13
	.long	0xa6
	.uleb128 0x14
	.string	"add"
	.byte	0x1
	.byte	0xe
	.long	0x3b
	.byte	0x1
	.long	0x2ee
	.uleb128 0xf
	.string	"b"
	.byte	0x1
	.byte	0xe
	.long	0x3b
	.byte	0
	.uleb128 0x15
	.long	.LASF76
	.byte	0x1
	.byte	0xa
	.long	0x3b
	.byte	0x1
	.uleb128 0x16
	.long	0x2ee
	.quad	.LFB71
	.quad	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.long	0x298
	.quad	.LFB73
	.quad	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.long	0x363
	.uleb128 0x18
	.long	0x2a8
	.long	.LLST0
	.uleb128 0x19
	.quad	.LVL2
	.long	0x768
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data14
	.uleb128 0x1a
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
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LASF50
	.byte	0x1
	.byte	0x1e
	.long	0x3b
	.quad	.LFB74
	.quad	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.long	0x3de
	.uleb128 0x1c
	.string	"val"
	.byte	0x1
	.byte	0x1e
	.long	0x3b
	.long	.LLST1
	.uleb128 0x1d
	.long	0x298
	.quad	.LBB38
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x20
	.uleb128 0x18
	.long	0x2a8
	.long	.LLST2
	.uleb128 0x19
	.quad	.LVL8
	.long	0x768
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data15
	.uleb128 0x1a
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
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LASF51
	.byte	0x1
	.byte	0x26
	.long	0x3b
	.quad	.LFB75
	.quad	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.long	0x6b2
	.uleb128 0x1f
	.long	.LASF52
	.byte	0x1
	.byte	0x26
	.long	0x3b
	.long	.LLST3
	.uleb128 0x1f
	.long	.LASF53
	.byte	0x1
	.byte	0x26
	.long	0x6b2
	.long	.LLST4
	.uleb128 0x20
	.long	.LASF77
	.byte	0x1
	.byte	0x29
	.long	0x3b
	.uleb128 0x21
	.long	0x2b2
	.quad	.LBB44
	.long	.Ldebug_ranges0+0x40
	.byte	0x1
	.byte	0x2a
	.long	0x469
	.uleb128 0x18
	.long	0x2c2
	.long	.LLST5
	.uleb128 0x19
	.quad	.LVL12
	.long	0x777
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x2b2
	.quad	.LBB50
	.quad	.LBE50-.LBB50
	.byte	0x1
	.byte	0x2d
	.long	0x4a9
	.uleb128 0x18
	.long	0x2c2
	.long	.LLST6
	.uleb128 0x19
	.quad	.LVL15
	.long	0x7b7
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	0x2d4
	.quad	.LBB52
	.long	.Ldebug_ranges0+0x80
	.byte	0x1
	.byte	0x2e
	.long	0x4ea
	.uleb128 0x18
	.long	0x2e4
	.long	.LLST7
	.uleb128 0x19
	.quad	.LVL30
	.long	0x768
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data16
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x2b2
	.quad	.LBB55
	.quad	.LBE55-.LBB55
	.byte	0x1
	.byte	0x2e
	.long	0x52f
	.uleb128 0x18
	.long	0x2c2
	.long	.LLST8
	.uleb128 0x19
	.quad	.LVL18
	.long	0x777
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x2b2
	.quad	.LBB57
	.quad	.LBE57-.LBB57
	.byte	0x1
	.byte	0x35
	.long	0x579
	.uleb128 0x18
	.long	0x2c2
	.long	.LLST9
	.uleb128 0x19
	.quad	.LVL19
	.long	0x777
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3f
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x2b2
	.quad	.LBB59
	.quad	.LBE59-.LBB59
	.byte	0x1
	.byte	0x36
	.long	0x5b9
	.uleb128 0x18
	.long	0x2c2
	.long	.LLST10
	.uleb128 0x19
	.quad	.LVL20
	.long	0x7b7
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC12
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x2b2
	.quad	.LBB61
	.quad	.LBE61-.LBB61
	.byte	0x1
	.byte	0x31
	.long	0x5f9
	.uleb128 0x18
	.long	0x2c2
	.long	.LLST11
	.uleb128 0x19
	.quad	.LVL22
	.long	0x7b7
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	0x298
	.quad	.LBB63
	.long	.Ldebug_ranges0+0xb0
	.byte	0x1
	.byte	0x32
	.long	0x63a
	.uleb128 0x18
	.long	0x2a8
	.long	.LLST12
	.uleb128 0x19
	.quad	.LVL28
	.long	0x768
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.Lubsan_data17
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x2b2
	.quad	.LBB66
	.quad	.LBE66-.LBB66
	.byte	0x1
	.byte	0x32
	.long	0x67f
	.uleb128 0x18
	.long	0x2c2
	.long	.LLST13
	.uleb128 0x19
	.quad	.LVL25
	.long	0x777
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC10
	.byte	0
	.byte	0
	.uleb128 0x23
	.quad	.LVL13
	.long	0x815
	.long	0x6a4
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 32
	.byte	0
	.uleb128 0x24
	.quad	.LVL35
	.long	0x825
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x8b
	.uleb128 0x25
	.long	.LASF54
	.byte	0x6
	.byte	0xa8
	.long	0x26c
	.uleb128 0x25
	.long	.LASF55
	.byte	0x6
	.byte	0xa9
	.long	0x26c
	.uleb128 0x26
	.long	.LASF56
	.byte	0x1
	.byte	0x7
	.long	0x3b
	.uleb128 0x9
	.byte	0x3
	.quad	MAX_LINE
	.uleb128 0x27
	.long	.LASF57
	.quad	.LFB78
	.quad	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.long	0x71f
	.uleb128 0x28
	.quad	.LVL36
	.long	0x82e
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LASAN0
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x40
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF58
	.quad	.LFB79
	.quad	.LFE79-.LFB79
	.uleb128 0x1
	.byte	0x9c
	.long	0x768
	.uleb128 0x24
	.quad	.LVL37
	.long	0x83d
	.uleb128 0x28
	.quad	.LVL38
	.long	0x84c
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LASAN0
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x40
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF59
	.long	.LASF61
	.byte	0x7
	.byte	0
	.long	.LASF59
	.uleb128 0x2a
	.long	.LASF78
	.long	.LASF78
	.byte	0x2
	.byte	0x57
	.uleb128 0x2b
	.uleb128 0x33
	.byte	0x9e
	.uleb128 0x31
	.byte	0x54
	.byte	0x68
	.byte	0x69
	.byte	0x73
	.byte	0x20
	.byte	0x69
	.byte	0x73
	.byte	0x20
	.byte	0x77
	.byte	0x68
	.byte	0x61
	.byte	0x74
	.byte	0x20
	.byte	0x68
	.byte	0x61
	.byte	0x70
	.byte	0x70
	.byte	0x65
	.byte	0x6e
	.byte	0x73
	.byte	0x20
	.byte	0x77
	.byte	0x68
	.byte	0x65
	.byte	0x6e
	.byte	0x20
	.byte	0x74
	.byte	0x68
	.byte	0x65
	.byte	0x20
	.byte	0x63
	.byte	0x6f
	.byte	0x6e
	.byte	0x64
	.byte	0x69
	.byte	0x74
	.byte	0x69
	.byte	0x6f
	.byte	0x6e
	.byte	0x20
	.byte	0x69
	.byte	0x73
	.byte	0x20
	.byte	0x74
	.byte	0x72
	.byte	0x75
	.byte	0x65
	.byte	0xa
	.byte	0
	.uleb128 0x29
	.long	.LASF60
	.long	.LASF62
	.byte	0x7
	.byte	0
	.long	.LASF60
	.uleb128 0x2b
	.uleb128 0x17
	.byte	0x9e
	.uleb128 0x15
	.byte	0x54
	.byte	0x68
	.byte	0x69
	.byte	0x73
	.byte	0x20
	.byte	0x61
	.byte	0x6c
	.byte	0x77
	.byte	0x61
	.byte	0x79
	.byte	0x73
	.byte	0x20
	.byte	0x68
	.byte	0x61
	.byte	0x70
	.byte	0x70
	.byte	0x65
	.byte	0x6e
	.byte	0x73
	.byte	0xa
	.byte	0
	.uleb128 0x2b
	.uleb128 0x34
	.byte	0x9e
	.uleb128 0x32
	.byte	0x54
	.byte	0x68
	.byte	0x69
	.byte	0x73
	.byte	0x20
	.byte	0x69
	.byte	0x73
	.byte	0x20
	.byte	0x77
	.byte	0x68
	.byte	0x61
	.byte	0x74
	.byte	0x20
	.byte	0x68
	.byte	0x61
	.byte	0x70
	.byte	0x70
	.byte	0x65
	.byte	0x6e
	.byte	0x73
	.byte	0x20
	.byte	0x77
	.byte	0x68
	.byte	0x65
	.byte	0x6e
	.byte	0x20
	.byte	0x74
	.byte	0x68
	.byte	0x65
	.byte	0x20
	.byte	0x63
	.byte	0x6f
	.byte	0x6e
	.byte	0x64
	.byte	0x69
	.byte	0x74
	.byte	0x69
	.byte	0x6f
	.byte	0x6e
	.byte	0x20
	.byte	0x69
	.byte	0x73
	.byte	0x20
	.byte	0x66
	.byte	0x61
	.byte	0x6c
	.byte	0x73
	.byte	0x65
	.byte	0xa
	.byte	0
	.uleb128 0x2c
	.long	.LASF63
	.long	.LASF64
	.byte	0x6
	.value	0x1be
	.long	.LASF63
	.uleb128 0x2d
	.long	.LASF79
	.long	.LASF79
	.uleb128 0x29
	.long	.LASF65
	.long	.LASF66
	.byte	0x7
	.byte	0
	.long	.LASF65
	.uleb128 0x29
	.long	.LASF67
	.long	.LASF68
	.byte	0x7
	.byte	0
	.long	.LASF67
	.uleb128 0x29
	.long	.LASF69
	.long	.LASF70
	.byte	0x7
	.byte	0
	.long	.LASF69
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
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
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2b
	.uleb128 0x36
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.quad	.LVL2-1
	.value	0x1
	.byte	0x54
	.quad	.LVL2-1
	.quad	.LFE73
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL3
	.quad	.LVL5
	.value	0x1
	.byte	0x55
	.quad	.LVL5
	.quad	.LVL6
	.value	0x1
	.byte	0x50
	.quad	.LVL6
	.quad	.LVL7
	.value	0x1
	.byte	0x55
	.quad	.LVL7
	.quad	.LVL8-1
	.value	0x1
	.byte	0x54
	.quad	.LVL8-1
	.quad	.LFE74
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL4
	.quad	.LVL5
	.value	0x1
	.byte	0x55
	.quad	.LVL6
	.quad	.LVL7
	.value	0x1
	.byte	0x55
	.quad	.LVL7
	.quad	.LVL8-1
	.value	0x1
	.byte	0x54
	.quad	.LVL8-1
	.quad	.LFE74
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL9
	.quad	.LVL10
	.value	0x1
	.byte	0x55
	.quad	.LVL10
	.quad	.LVL31
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL31
	.quad	.LVL33
	.value	0x1
	.byte	0x55
	.quad	.LVL33
	.quad	.LFE75
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL9
	.quad	.LVL10
	.value	0x1
	.byte	0x54
	.quad	.LVL10
	.quad	.LVL31
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL31
	.quad	.LVL32
	.value	0x1
	.byte	0x54
	.quad	.LVL32
	.quad	.LFE75
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL11
	.quad	.LVL12
	.value	0xa
	.byte	0x3
	.quad	.LC5
	.byte	0x9f
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL14
	.quad	.LVL15
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1922
	.sleb128 0
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL16
	.quad	.LVL17
	.value	0x1
	.byte	0x51
	.quad	.LVL28
	.quad	.LVL29
	.value	0x1
	.byte	0x51
	.quad	.LVL29
	.quad	.LVL30-1
	.value	0x2
	.byte	0x7c
	.sleb128 -64
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL17
	.quad	.LVL18
	.value	0xa
	.byte	0x3
	.quad	.LC8
	.byte	0x9f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL18
	.quad	.LVL19
	.value	0xa
	.byte	0x3
	.quad	.LC11
	.byte	0x9f
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL19
	.quad	.LVL20
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1990
	.sleb128 0
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL21
	.quad	.LVL22
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2015
	.sleb128 0
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL23
	.quad	.LVL24
	.value	0x1
	.byte	0x51
	.quad	.LVL26
	.quad	.LVL27
	.value	0x1
	.byte	0x51
	.quad	.LVL27
	.quad	.LVL28-1
	.value	0x2
	.byte	0x7c
	.sleb128 -64
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL24
	.quad	.LVL26
	.value	0xa
	.byte	0x3
	.quad	.LC10
	.byte	0x9f
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x5c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB75
	.quad	.LFE75-.LFB75
	.quad	.LFB78
	.quad	.LFE78-.LFB78
	.quad	.LFB79
	.quad	.LFE79-.LFB79
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB38
	.quad	.LBE38
	.quad	.LBB42
	.quad	.LBE42
	.quad	.LBB43
	.quad	.LBE43
	.quad	0
	.quad	0
	.quad	.LBB44
	.quad	.LBE44
	.quad	.LBB48
	.quad	.LBE48
	.quad	.LBB49
	.quad	.LBE49
	.quad	0
	.quad	0
	.quad	.LBB52
	.quad	.LBE52
	.quad	.LBB69
	.quad	.LBE69
	.quad	0
	.quad	0
	.quad	.LBB63
	.quad	.LBE63
	.quad	.LBB68
	.quad	.LBE68
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB75
	.quad	.LFE75
	.quad	.LFB78
	.quad	.LFE78
	.quad	.LFB79
	.quad	.LFE79
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF29:
	.string	"_flags2"
.LASF30:
	.string	"_old_offset"
.LASF62:
	.string	"__builtin_puts"
.LASF78:
	.string	"__printf_chk"
.LASF43:
	.string	"_IO_FILE"
.LASF64:
	.string	"scanf"
.LASF25:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF10:
	.string	"sizetype"
.LASF63:
	.string	"__isoc99_scanf"
.LASF35:
	.string	"_offset"
.LASF49:
	.string	"add2"
.LASF50:
	.string	"add3"
.LASF19:
	.string	"_IO_write_ptr"
.LASF14:
	.string	"_flags"
.LASF21:
	.string	"_IO_buf_base"
.LASF26:
	.string	"_markers"
.LASF16:
	.string	"_IO_read_end"
.LASF72:
	.string	"./simple_program.c"
.LASF65:
	.string	"__asan_unregister_globals"
.LASF12:
	.string	"long long int"
.LASF34:
	.string	"_lock"
.LASF70:
	.string	"__builtin___asan_register_globals"
.LASF75:
	.string	"printf"
.LASF57:
	.string	"_GLOBAL__sub_D_00099_0_MAX_LINE"
.LASF31:
	.string	"_cur_column"
.LASF47:
	.string	"_pos"
.LASF67:
	.string	"__asan_init_v4"
.LASF53:
	.string	"argv"
.LASF46:
	.string	"_sbuf"
.LASF56:
	.string	"MAX_LINE"
.LASF66:
	.string	"__builtin___asan_unregister_globals"
.LASF69:
	.string	"__asan_register_globals"
.LASF2:
	.string	"unsigned char"
.LASF76:
	.string	"add0"
.LASF52:
	.string	"argc"
.LASF4:
	.string	"signed char"
.LASF13:
	.string	"long long unsigned int"
.LASF58:
	.string	"_GLOBAL__sub_I_00099_1_MAX_LINE"
.LASF61:
	.string	"__builtin___ubsan_handle_add_overflow_abort"
.LASF1:
	.string	"unsigned int"
.LASF44:
	.string	"_IO_marker"
.LASF33:
	.string	"_shortbuf"
.LASF0:
	.string	"long unsigned int"
.LASF60:
	.string	"puts"
.LASF18:
	.string	"_IO_write_base"
.LASF42:
	.string	"_unused2"
.LASF73:
	.string	"/home/francis/Documents/ThesisWork/Instrumentation"
.LASF15:
	.string	"_IO_read_ptr"
.LASF22:
	.string	"_IO_buf_end"
.LASF11:
	.string	"char"
.LASF6:
	.string	"long int"
.LASF51:
	.string	"main"
.LASF59:
	.string	"__ubsan_handle_add_overflow_abort"
.LASF45:
	.string	"_next"
.LASF36:
	.string	"__pad1"
.LASF37:
	.string	"__pad2"
.LASF38:
	.string	"__pad3"
.LASF39:
	.string	"__pad4"
.LASF40:
	.string	"__pad5"
.LASF3:
	.string	"short unsigned int"
.LASF48:
	.string	"__fmt"
.LASF71:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -g -O0 -O3 -fsanitize=address,undefined -fno-sanitize-recover=undefined -funroll-loops -fstack-protector-strong"
.LASF20:
	.string	"_IO_write_end"
.LASF9:
	.string	"__off64_t"
.LASF68:
	.string	"__builtin___asan_init_v4"
.LASF28:
	.string	"_fileno"
.LASF27:
	.string	"_chain"
.LASF8:
	.string	"__off_t"
.LASF24:
	.string	"_IO_backup_base"
.LASF54:
	.string	"stdin"
.LASF77:
	.string	"decider"
.LASF41:
	.string	"_mode"
.LASF17:
	.string	"_IO_read_base"
.LASF32:
	.string	"_vtable_offset"
.LASF23:
	.string	"_IO_save_base"
.LASF79:
	.string	"__stack_chk_fail"
.LASF55:
	.string	"stdout"
.LASF74:
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

  /* Phone home and tell the parent that we're OK. (Note that signals with
     no SA_RESTART will mess it up). If this fails, assume that the fd is
     closed because we were execve()d from an instrumented binary, or because
     the parent doesn't want to use the fork server. */

  movq $4, %rdx               /* length    */
  leaq __afl_temp(%rip), %rsi /* data      */
  movq $(198 + 1), %rdi       /* file desc */
call write@PLT

  cmpq $4, %rax
  jne  __afl_fork_resume

__afl_fork_wait_loop:

  /* Wait for parent by reading from the pipe. Abort if read fails. */

  movq $4, %rdx               /* length    */
  leaq __afl_temp(%rip), %rsi /* data      */
  movq $198, %rdi             /* file desc */
call read@PLT
  cmpq $4, %rax
  jne  __afl_die

  /* Once woken up, create a clone of our process. This is an excellent use
     case for syscall(__NR_clone, 0, CLONE_PARENT), but glibc boneheadedly
     caches getpid() results and offers no way to update the value, breaking
     abort(), raise(), and a bunch of other things :-( */

call fork@PLT
  cmpq $0, %rax
  jl   __afl_die
  je   __afl_fork_resume

  /* In parent process: write PID to pipe, then wait for child. */

  movl %eax, __afl_fork_pid(%rip)

  movq $4, %rdx                   /* length    */
  leaq __afl_fork_pid(%rip), %rsi /* data      */
  movq $(198 + 1), %rdi             /* file desc */
call write@PLT

  movq $0, %rdx                   /* no flags  */
  leaq __afl_temp(%rip), %rsi     /* status    */
  movq __afl_fork_pid(%rip), %rdi /* PID       */
call waitpid@PLT
  cmpq $0, %rax
  jle  __afl_die

  /* Relay wait status to pipe, then loop back. */

  movq $4, %rdx               /* length    */
  leaq __afl_temp(%rip), %rsi /* data      */
  movq $(198 + 1), %rdi         /* file desc */
call write@PLT

  jmp  __afl_fork_wait_loop

__afl_fork_resume:

  /* In child process: close fds, resume execution. */

  movq $198, %rdi
call close@PLT

  movq $(198 + 1), %rdi
call close@PLT

  popq %rdx
  popq %rdx

  movq %r12, %rsp
  popq %r12

  movq  0(%rsp), %rax
  movq  8(%rsp), %rcx
  movq 16(%rsp), %rdi
  movq 32(%rsp), %rsi
  movq 40(%rsp), %r8
  movq 48(%rsp), %r9
  movq 56(%rsp), %r10
  movq 64(%rsp), %r11

  movq  96(%rsp), %xmm0
  movq 112(%rsp), %xmm1
  movq 128(%rsp), %xmm2
  movq 144(%rsp), %xmm3
  movq 160(%rsp), %xmm4
  movq 176(%rsp), %xmm5
  movq 192(%rsp), %xmm6
  movq 208(%rsp), %xmm7
  movq 224(%rsp), %xmm8
  movq 240(%rsp), %xmm9
  movq 256(%rsp), %xmm10
  movq 272(%rsp), %xmm11
  movq 288(%rsp), %xmm12
  movq 304(%rsp), %xmm13
  movq 320(%rsp), %xmm14
  movq 336(%rsp), %xmm15

  leaq 352(%rsp), %rsp

  jmp  __afl_store

__afl_die:

  xorq %rax, %rax
call _exit@PLT

__afl_setup_abort:

  /* Record setup failure so that we don't keep calling
     shmget() / shmat() over and over again. */

  incb __afl_setup_failure(%rip)

  movq %r12, %rsp
  popq %r12

  movq  0(%rsp), %rax
  movq  8(%rsp), %rcx
  movq 16(%rsp), %rdi
  movq 32(%rsp), %rsi
  movq 40(%rsp), %r8
  movq 48(%rsp), %r9
  movq 56(%rsp), %r10
  movq 64(%rsp), %r11

  movq  96(%rsp), %xmm0
  movq 112(%rsp), %xmm1
  movq 128(%rsp), %xmm2
  movq 144(%rsp), %xmm3
  movq 160(%rsp), %xmm4
  movq 176(%rsp), %xmm5
  mov