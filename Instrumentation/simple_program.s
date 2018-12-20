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
.LFB71:
	.file 1 "./simple_program.c"
	.loc 1 10 0
	.cfi_startproc
	.loc 1 12 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000c05, %rcx
movq $0x00000c05, %r13
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

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
.LFB77:
	.cfi_startproc

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000bd9f, %rcx
movq $0x0000bd9f, %r13
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leal	4(%rdi), %eax
	testb	$1, %dil
	cmovne	%edi, %eax
	ret
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
.LFB73:
	.loc 1 20 0
	.cfi_startproc
.LVL0:
	.loc 1 22 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000bd9f, %rcx
movq $0x0000bd9f, %r13
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leal	4(%rdi), %eax
	testb	$1, %dil
	cmovne	%edi, %eax
	.loc 1 24 0
	ret
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
.LFB74:
	.loc 1 30 0
	.cfi_startproc
.LVL1:
	.loc 1 31 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000074da, %rcx
movq $0x000074da, %r13
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	%edi, %eax
	movl	$1431655766, %edx
	movl	%edi, %ecx
	imull	%edx
	sarl	$31, %ecx
	movl	%edi, %eax
	subl	%ecx, %edx
	leal	(%rdx,%rdx,2), %esi
	cmpl	%esi, %edi
	jne	.L9

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00008a7b, %rcx
movq $0x00008a7b, %r13
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LVL2:
.LBB38:
.LBB39:
	.loc 1 22 0
	leal	4(%rdi), %edi
.LVL3:
	testb	$1, %al
	cmove	%edi, %eax
.LVL4:
.L9:
.LBE39:
.LBE38:
	.loc 1 35 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000ab4, %rcx
movq $0x00000ab4, %r13
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	rep ret
	.cfi_endproc
.LFE74:
	.size	add3, .-add3
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"Decider = "
.LC5:
	.string	"%d"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"This is what happens when the condition is true"
	.section	.rodata.str1.1
.LC7:
	.string	"add %d + 4 = %d\n"
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"This is what happens when the condition is false"
	.section	.rodata.str1.1
.LC9:
	.string	"add2 %d + 4 = %d\n"
.LC10:
	.string	"%d\n"
.LC11:
	.string	"This always happens"
	.section	.text.unlikely
.LCOLDB12:
	.section	.text.startup,"ax",@progbits
.LHOTB12:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB75:
	.loc 1 38 0
	.cfi_startproc
.LVL5:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00002367, %rcx
movq $0x00002367, %r13
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	subq	$24, %rsp
	.cfi_def_cfa_offset 32
.LBB40:
.LBB41:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 104 0
	movl	$.LC4, %esi
.LVL6:
	movl	$1, %edi
.LVL7:
.LBE41:
.LBE40:
	.loc 1 38 0
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
.LVL8:
.LBB43:
.LBB42:
	.loc 2 104 0
	call	__printf_chk
.LVL9:
.LBE42:
.LBE43:
	.loc 1 43 0
	leaq	4(%rsp), %rsi
	xorl	%eax, %eax
	movl	$.LC5, %edi
	call	__isoc99_scanf
.LVL10:
	.loc 1 44 0
	cmpl	$5, 4(%rsp)
	jle	.L14

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000071ab, %rcx
movq $0x000071ab, %r13
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LVL11:
.LBB44:
.LBB45:
	.loc 2 104 0
	movl	$.LC6, %edi
	call	puts
.LVL12:
.LBE45:
.LBE44:
	.loc 1 46 0
	movl	4(%rsp), %edx
.LVL13:
.LBB46:
.LBB47:
	.loc 2 104 0
	movl	$.LC7, %esi
	movl	$1, %edi
.LBE47:
.LBE46:
.LBB49:
.LBB50:
	.loc 1 16 0
	leal	4(%rdx), %ecx
	testb	$1, %dl
	cmovne	%edx, %ecx
.LVL14:
.LBE50:
.LBE49:
.LBB51:
.LBB48:
	.loc 2 104 0
	xorl	%eax, %eax
	call	__printf_chk
.LVL15:
.L16:
.LBE48:
.LBE51:
.LBB52:
.LBB53:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000f2ed, %rcx
movq $0x0000f2ed, %r13
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$15, %edx
	movl	$.LC10, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.LVL16:
.LBE53:
.LBE52:
.LBB54:
.LBB55:
	movl	$.LC11, %edi
	call	puts
.LVL17:
.LBE55:
.LBE54:
	.loc 1 59 0
	xorl	%eax, %eax
	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L22

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000bc1, %rcx
movq $0x00000bc1, %r13
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
.L14:
	.cfi_restore_state
.LVL18:
.LBB56:
.LBB57:
	.loc 2 104 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000dfcd, %rcx
movq $0x0000dfcd, %r13
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC8, %edi
	call	puts
.LVL19:
.LBE57:
.LBE56:
	.loc 1 50 0
	movl	4(%rsp), %edx
.LVL20:
.LBB58:
.LBB59:
	.loc 2 104 0
	movl	$.LC9, %esi
	movl	$1, %edi
.LBE59:
.LBE58:
.LBB61:
.LBB62:
	.loc 1 22 0
	leal	4(%rdx), %ecx
	testb	$1, %dl
	cmovne	%edx, %ecx
.LVL21:
.LBE62:
.LBE61:
.LBB63:
.LBB60:
	.loc 2 104 0
	xorl	%eax, %eax
	call	__printf_chk
.LVL22:
	jmp	.L16
.LVL23:
.L22:
.LBE60:
.LBE63:
	.loc 1 59 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00005334, %rcx
movq $0x00005334, %r13
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	call	__stack_chk_fail
.LVL24:
	.cfi_endproc
.LFE75:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE12:
	.section	.text.startup
.LHOTE12:
	.globl	MAX_LINE
	.data
	.align 4
	.type	MAX_LINE, @object
	.size	MAX_LINE, 4
MAX_LINE:
	.long	150
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
	.long	0x702
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF61
	.byte	0xc
	.long	.LASF62
	.long	.LASF63
	.long	.Ldebug_ranges0+0x90
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
	.long	.LASF64
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
	.long	.LASF65
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
	.long	.LASF66
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
	.long	0x334
	.uleb128 0x18
	.long	0x2a8
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x19
	.long	.LASF50
	.byte	0x1
	.byte	0x1e
	.long	0x3b
	.quad	.LFB74
	.quad	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.long	0x386
	.uleb128 0x1a
	.string	"val"
	.byte	0x1
	.byte	0x1e
	.long	0x3b
	.long	.LLST0
	.uleb128 0x1b
	.long	0x298
	.quad	.LBB38
	.quad	.LBE38-.LBB38
	.byte	0x1
	.byte	0x20
	.uleb128 0x1c
	.long	0x2a8
	.long	.LLST1
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LASF51
	.byte	0x1
	.byte	0x26
	.long	0x3b
	.quad	.LFB75
	.quad	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.long	0x61d
	.uleb128 0x1d
	.long	.LASF52
	.byte	0x1
	.byte	0x26
	.long	0x3b
	.long	.LLST2
	.uleb128 0x1d
	.long	.LASF53
	.byte	0x1
	.byte	0x26
	.long	0x61d
	.long	.LLST3
	.uleb128 0x1e
	.long	.LASF67
	.byte	0x1
	.byte	0x29
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1f
	.long	0x2b2
	.quad	.LBB40
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x2a
	.long	0x414
	.uleb128 0x1c
	.long	0x2c2
	.long	.LLST4
	.uleb128 0x20
	.quad	.LVL9
	.long	0x64e
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x2b2
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.byte	0x1
	.byte	0x2d
	.long	0x454
	.uleb128 0x1c
	.long	0x2c2
	.long	.LLST5
	.uleb128 0x20
	.quad	.LVL12
	.long	0x68e
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	0x2b2
	.quad	.LBB46
	.long	.Ldebug_ranges0+0x30
	.byte	0x1
	.byte	0x2e
	.long	0x495
	.uleb128 0x1c
	.long	0x2c2
	.long	.LLST6
	.uleb128 0x20
	.quad	.LVL15
	.long	0x64e
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x2d4
	.quad	.LBB49
	.quad	.LBE49-.LBB49
	.byte	0x1
	.byte	0x2e
	.long	0x4ba
	.uleb128 0x1c
	.long	0x2e4
	.long	.LLST7
	.byte	0
	.uleb128 0x22
	.long	0x2b2
	.quad	.LBB52
	.quad	.LBE52-.LBB52
	.byte	0x1
	.byte	0x35
	.long	0x504
	.uleb128 0x1c
	.long	0x2c2
	.long	.LLST8
	.uleb128 0x20
	.quad	.LVL16
	.long	0x64e
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC10
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3f
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x2b2
	.quad	.LBB54
	.quad	.LBE54-.LBB54
	.byte	0x1
	.byte	0x36
	.long	0x544
	.uleb128 0x1c
	.long	0x2c2
	.long	.LLST9
	.uleb128 0x20
	.quad	.LVL17
	.long	0x68e
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x2b2
	.quad	.LBB56
	.quad	.LBE56-.LBB56
	.byte	0x1
	.byte	0x31
	.long	0x584
	.uleb128 0x1c
	.long	0x2c2
	.long	.LLST10
	.uleb128 0x20
	.quad	.LVL19
	.long	0x68e
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	0x2b2
	.quad	.LBB58
	.long	.Ldebug_ranges0+0x60
	.byte	0x1
	.byte	0x32
	.long	0x5c5
	.uleb128 0x1c
	.long	0x2c2
	.long	.LLST11
	.uleb128 0x20
	.quad	.LVL22
	.long	0x64e
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x298
	.quad	.LBB61
	.quad	.LBE61-.LBB61
	.byte	0x1
	.byte	0x32
	.long	0x5ea
	.uleb128 0x1c
	.long	0x2a8
	.long	.LLST12
	.byte	0
	.uleb128 0x23
	.quad	.LVL10
	.long	0x6ec
	.long	0x60f
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x24
	.quad	.LVL24
	.long	0x6fc
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
	.long	.LASF68
	.long	.LASF68
	.byte	0x2
	.byte	0x57
	.uleb128 0x28
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
	.long	.LASF57
	.long	.LASF59
	.byte	0x7
	.byte	0
	.long	.LASF57
	.uleb128 0x28
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
	.uleb128 0x28
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
	.uleb128 0x2a
	.long	.LASF58
	.long	.LASF60
	.byte	0x6
	.value	0x1be
	.long	.LASF58
	.uleb128 0x2b
	.long	.LASF69
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
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
	.uleb128 0x28
	.uleb128 0x36
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x5
	.uleb128 0x6e
	.uleb128 0xe
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL1
	.quad	.LVL3
	.value	0x1
	.byte	0x55
	.quad	.LVL3
	.quad	.LVL4
	.value	0x1
	.byte	0x50
	.quad	.LVL4
	.quad	.LFE74
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL2
	.quad	.LVL3
	.value	0x1
	.byte	0x55
	.quad	.LVL3
	.quad	.LVL4
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL5
	.quad	.LVL7
	.value	0x1
	.byte	0x55
	.quad	.LVL7
	.quad	.LFE75
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL5
	.quad	.LVL6
	.value	0x1
	.byte	0x54
	.quad	.LVL6
	.quad	.LFE75
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL8
	.quad	.LVL9
	.value	0xa
	.byte	0x3
	.quad	.LC4
	.byte	0x9f
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL11
	.quad	.LVL12
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1625
	.sleb128 0
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL14
	.quad	.LVL15
	.value	0xa
	.byte	0x3
	.quad	.LC7
	.byte	0x9f
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL13
	.quad	.LVL14
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL15
	.quad	.LVL16
	.value	0xa
	.byte	0x3
	.quad	.LC10
	.byte	0x9f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL16
	.quad	.LVL17
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1693
	.sleb128 0
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL18
	.quad	.LVL19
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1718
	.sleb128 0
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL21
	.quad	.LVL23
	.value	0xa
	.byte	0x3
	.quad	.LC9
	.byte	0x9f
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL20
	.quad	.LVL21
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
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
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB40
	.quad	.LBE40
	.quad	.LBB43
	.quad	.LBE43
	.quad	0
	.quad	0
	.quad	.LBB46
	.quad	.LBE46
	.quad	.LBB51
	.quad	.LBE51
	.quad	0
	.quad	0
	.quad	.LBB58
	.quad	.LBE58
	.quad	.LBB63
	.quad	.LBE63
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB75
	.quad	.LFE75
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF29:
	.string	"_flags2"
.LASF59:
	.string	"__builtin_puts"
.LASF68:
	.string	"__printf_chk"
.LASF43:
	.string	"_IO_FILE"
.LASF60:
	.string	"scanf"
.LASF25:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF10:
	.string	"sizetype"
.LASF58:
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
.LASF62:
	.string	"./simple_program.c"
.LASF12:
	.string	"long long int"
.LASF61:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -O3 -funroll-loops -fstack-protector-strong"
.LASF34:
	.string	"_lock"
.LASF6:
	.string	"long int"
.LASF65:
	.string	"printf"
.LASF31:
	.string	"_cur_column"
.LASF47:
	.string	"_pos"
.LASF53:
	.string	"argv"
.LASF46:
	.string	"_sbuf"
.LASF56:
	.string	"MAX_LINE"
.LASF30:
	.string	"_old_offset"
.LASF2:
	.string	"unsigned char"
.LASF66:
	.string	"add0"
.LASF52:
	.string	"argc"
.LASF4:
	.string	"signed char"
.LASF13:
	.string	"long long unsigned int"
.LASF1:
	.string	"unsigned int"
.LASF44:
	.string	"_IO_marker"
.LASF33:
	.string	"_shortbuf"
.LASF57:
	.string	"puts"
.LASF18:
	.string	"_IO_write_base"
.LASF42:
	.string	"_unused2"
.LASF63:
	.string	"/home/francis/Documents/ThesisWork/Instrumentation"
.LASF15:
	.string	"_IO_read_ptr"
.LASF22:
	.string	"_IO_buf_end"
.LASF11:
	.string	"char"
.LASF51:
	.string	"main"
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
.LASF0:
	.string	"long unsigned int"
.LASF20:
	.string	"_IO_write_end"
.LASF9:
	.string	"__off64_t"
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
.LASF67:
	.string	"decider"
.LASF41:
	.string	"_mode"
.LASF17:
	.string	"_IO_read_base"
.LASF32:
	.string	"_vtable_offset"
.LASF23:
	.string	"_IO_save_base"
.LASF69:
	.string	"__stack_chk_fail"
.LASF55:
	.string	"stdout"
.LASF64:
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

  movq %r13, __afl_block_temp(%rip)
  
/* Write home and tell them the id of the block */
  movq $4, %rdx               /* length    */
  leaq __afl_block_temp, %rsi
  movq $(198 + 1), %rdi       /* file desc */
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
  mov