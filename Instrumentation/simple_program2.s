	.file	"simple_program2.c"
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
	.globl	add2
	.type	add2, @function
add2:
.LFB71:
	.file 1 "./simple_program2.c"
	.loc 1 10 0
	.cfi_startproc
.LVL0:
	.loc 1 12 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00006277, %rcx
movl $0x00006277, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leal	(%rdi,%rdi), %eax
	.loc 1 13 0
	ret
	.cfi_endproc
.LFE71:
	.size	add2, .-add2
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"val = %d\n"
.LC2:
	.string	"val < 10 and %d\n"
.LC3:
	.string	"val < 20 and %d\n"
.LC4:
	.string	"val < 30 and %d\n"
.LC5:
	.string	"val < 40"
.LC6:
	.string	"love is in the air"
	.section	.text.unlikely
.LCOLDB7:
	.section	.text.startup,"ax",@progbits
.LHOTB7:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB72:
	.loc 1 15 0
	.cfi_startproc
.LVL1:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000f3f5, %rcx
movl $0x0000f3f5, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 15 0
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	.loc 1 20 0
	movq	%rsp, %rdi
.LVL2:
	call	time
.LVL3:
	movl	%eax, %edi
	call	srand
.LVL4:
	.loc 1 22 0
	call	rand
.LVL5:
	movl	$1374389535, %edx
	movl	%eax, %ebx
.LBB34:
.LBB35:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 104 0
	movl	$.LC1, %esi
.LBE35:
.LBE34:
	.loc 1 22 0
	imull	%edx
	movl	%ebx, %eax
.LBB39:
.LBB36:
	.loc 2 104 0
	movl	$1, %edi
.LBE36:
.LBE39:
	.loc 1 22 0
	sarl	$31, %eax
	sarl	$4, %edx
	subl	%eax, %edx
.LBB40:
.LBB37:
	.loc 2 104 0
	xorl	%eax, %eax
.LBE37:
.LBE40:
	.loc 1 22 0
	imull	$50, %edx, %ecx
	subl	%ecx, %ebx
	addl	$1, %ebx
.LVL6:
.LBB41:
.LBB38:
	.loc 2 104 0
	movl	%ebx, %edx
	call	__printf_chk
.LVL7:
.LBE38:
.LBE41:
	.loc 1 26 0
	cmpl	$9, %ebx
	jle	.L11

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000b7f, %rcx
movl $0x00000b7f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 30 0
	cmpl	$19, %ebx
	jle	.L12

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000b7f, %rcx
movl $0x00000b7f, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 34 0
	cmpl	$29, %ebx
	jle	.L13

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000008a5, %rcx
movl $0x000008a5, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	.loc 1 38 0
	cmpl	$39, %ebx
	jg	.L7

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x0000217b, %rcx
movl $0x0000217b, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

.LVL8:
.LBB42:
.LBB43:
	.loc 2 104 0
	movl	$.LC5, %edi
	call	puts
.LVL9:
.LVL10:
.L2:
.LBE43:
.LBE42:
	.loc 1 47 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00006deb, %rcx
movl $0x00006deb, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L14

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00001c2a, %rcx
movl $0x00001c2a, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL11:
	ret
.LVL12:
.L7:
	.cfi_restore_state
.LBB44:
.LBB45:
	.loc 2 104 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000051a7, %rcx
movl $0x000051a7, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC6, %edi
	call	puts
.LVL13:
	xorl	%eax, %eax
	jmp	.L2
.L11:
.LVL14:
.LBE45:
.LBE44:
.LBB46:
.LBB47:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000021f9, %rcx
movl $0x000021f9, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leal	(%rbx,%rbx), %edx
	movl	$.LC2, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.LVL15:
	jmp	.L2
.LVL16:
.L13:
.LBE47:
.LBE46:
.LBB48:
.LBB49:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000021f9, %rcx
movl $0x000021f9, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leal	(%rbx,%rbx), %edx
	movl	$.LC4, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.LVL17:
	jmp	.L2
.LVL18:
.L12:
.LBE49:
.LBE48:
.LBB50:
.LBB51:

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x000021f9, %rcx
movl $0x000021f9, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	leal	(%rbx,%rbx), %edx
	movl	$.LC3, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.LVL19:
	jmp	.L2
.LVL20:
.L14:
.LBE51:
.LBE50:
	.loc 1 47 0

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
.LVL21:
	.cfi_endproc
.LFE72:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE7:
	.section	.text.startup
.LHOTE7:
	.section	.rodata.str1.1
.LC8:
	.string	"Hello, Dabe"
	.section	.text.unlikely
.LCOLDB9:
	.text
.LHOTB9:
	.p2align 4,,15
	.globl	teste
	.type	teste, @function
teste:
.LFB73:
	.loc 1 49 0
	.cfi_startproc
.LVL22:
.LBB52:
.LBB53:
	.loc 2 104 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00009c02, %rcx
movl $0x00009c02, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	movl	$.LC8, %esi
	movl	$1, %edi
.LVL23:
	xorl	%eax, %eax
	jmp	__printf_chk
.LVL24:
.LBE53:
.LBE52:
	.cfi_endproc
.LFE73:
	.size	teste, .-teste
	.section	.text.unlikely
.LCOLDE9:
	.text
.LHOTE9:
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
	.file 5 "/usr/include/time.h"
	.file 6 "/usr/include/libio.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/usr/include/stdlib.h"
	.file 9 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x689
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF62
	.byte	0xc
	.long	.LASF63
	.long	.LASF64
	.long	.Ldebug_ranges0+0x50
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
	.uleb128 0x2
	.long	.LASF11
	.byte	0x4
	.byte	0x8b
	.long	0x65
	.uleb128 0x5
	.byte	0x8
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
	.byte	0x5
	.byte	0x4b
	.long	0x89
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
	.byte	0x6
	.byte	0xf1
	.long	0x244
	.uleb128 0x9
	.long	.LASF16
	.byte	0x6
	.byte	0xf2
	.long	0x3b
	.byte	0
	.uleb128 0x9
	.long	.LASF17
	.byte	0x6
	.byte	0xf7
	.long	0x96
	.byte	0x8
	.uleb128 0x9
	.long	.LASF18
	.byte	0x6
	.byte	0xf8
	.long	0x96
	.byte	0x10
	.uleb128 0x9
	.long	.LASF19
	.byte	0x6
	.byte	0xf9
	.long	0x96
	.byte	0x18
	.uleb128 0x9
	.long	.LASF20
	.byte	0x6
	.byte	0xfa
	.long	0x96
	.byte	0x20
	.uleb128 0x9
	.long	.LASF21
	.byte	0x6
	.byte	0xfb
	.long	0x96
	.byte	0x28
	.uleb128 0x9
	.long	.LASF22
	.byte	0x6
	.byte	0xfc
	.long	0x96
	.byte	0x30
	.uleb128 0x9
	.long	.LASF23
	.byte	0x6
	.byte	0xfd
	.long	0x96
	.byte	0x38
	.uleb128 0x9
	.long	.LASF24
	.byte	0x6
	.byte	0xfe
	.long	0x96
	.byte	0x40
	.uleb128 0xa
	.long	.LASF25
	.byte	0x6
	.value	0x100
	.long	0x96
	.byte	0x48
	.uleb128 0xa
	.long	.LASF26
	.byte	0x6
	.value	0x101
	.long	0x96
	.byte	0x50
	.uleb128 0xa
	.long	.LASF27
	.byte	0x6
	.value	0x102
	.long	0x96
	.byte	0x58
	.uleb128 0xa
	.long	.LASF28
	.byte	0x6
	.value	0x104
	.long	0x27c
	.byte	0x60
	.uleb128 0xa
	.long	.LASF29
	.byte	0x6
	.value	0x106
	.long	0x282
	.byte	0x68
	.uleb128 0xa
	.long	.LASF30
	.byte	0x6
	.value	0x108
	.long	0x3b
	.byte	0x70
	.uleb128 0xa
	.long	.LASF31
	.byte	0x6
	.value	0x10c
	.long	0x3b
	.byte	0x74
	.uleb128 0xa
	.long	.LASF32
	.byte	0x6
	.value	0x10e
	.long	0x6c
	.byte	0x78
	.uleb128 0xa
	.long	.LASF33
	.byte	0x6
	.value	0x112
	.long	0x50
	.byte	0x80
	.uleb128 0xa
	.long	.LASF34
	.byte	0x6
	.value	0x113
	.long	0x57
	.byte	0x82
	.uleb128 0xa
	.long	.LASF35
	.byte	0x6
	.value	0x114
	.long	0x288
	.byte	0x83
	.uleb128 0xa
	.long	.LASF36
	.byte	0x6
	.value	0x118
	.long	0x298
	.byte	0x88
	.uleb128 0xa
	.long	.LASF37
	.byte	0x6
	.value	0x121
	.long	0x77
	.byte	0x90
	.uleb128 0xa
	.long	.LASF38
	.byte	0x6
	.value	0x129
	.long	0x94
	.byte	0x98
	.uleb128 0xa
	.long	.LASF39
	.byte	0x6
	.value	0x12a
	.long	0x94
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF40
	.byte	0x6
	.value	0x12b
	.long	0x94
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF41
	.byte	0x6
	.value	0x12c
	.long	0x94
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF42
	.byte	0x6
	.value	0x12e
	.long	0x29
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF43
	.byte	0x6
	.value	0x12f
	.long	0x3b
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF44
	.byte	0x6
	.value	0x131
	.long	0x29e
	.byte	0xc4
	.byte	0
	.uleb128 0xb
	.long	.LASF65
	.byte	0x6
	.byte	0x96
	.uleb128 0x8
	.long	.LASF46
	.byte	0x18
	.byte	0x6
	.byte	0x9c
	.long	0x27c
	.uleb128 0x9
	.long	.LASF47
	.byte	0x6
	.byte	0x9d
	.long	0x27c
	.byte	0
	.uleb128 0x9
	.long	.LASF48
	.byte	0x6
	.byte	0x9e
	.long	0x282
	.byte	0x8
	.uleb128 0x9
	.long	.LASF49
	.byte	0x6
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
	.long	.LASF66
	.byte	0x2
	.byte	0x66
	.long	0x3b
	.byte	0x3
	.long	0x2cb
	.uleb128 0xf
	.long	.LASF50
	.byte	0x2
	.byte	0x66
	.long	0x2cb
	.uleb128 0x10
	.byte	0
	.uleb128 0x11
	.long	0xbc
	.uleb128 0x12
	.long	.LASF67
	.byte	0x1
	.byte	0xa
	.long	0x3b
	.byte	0x1
	.long	0x2f7
	.uleb128 0xf
	.long	.LASF51
	.byte	0x1
	.byte	0xa
	.long	0x3b
	.uleb128 0xf
	.long	.LASF52
	.byte	0x1
	.byte	0xa
	.long	0x3b
	.byte	0
	.uleb128 0x13
	.long	0x2d0
	.quad	.LFB71
	.quad	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.long	0x323
	.uleb128 0x14
	.long	0x2e0
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x15
	.long	0x2eb
	.long	.LLST0
	.byte	0
	.uleb128 0x16
	.long	.LASF68
	.byte	0x1
	.byte	0xf
	.long	0x3b
	.quad	.LFB72
	.quad	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.long	0x57c
	.uleb128 0x17
	.long	.LASF53
	.byte	0x1
	.byte	0xf
	.long	0x3b
	.long	.LLST1
	.uleb128 0x17
	.long	.LASF54
	.byte	0x1
	.byte	0xf
	.long	0x57c
	.long	.LLST2
	.uleb128 0x18
	.string	"val"
	.byte	0x1
	.byte	0x11
	.long	0x3b
	.long	.LLST3
	.uleb128 0x19
	.string	"t"
	.byte	0x1
	.byte	0x12
	.long	0xaa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.long	.LASF59
	.byte	0x1
	.byte	0x14
	.long	0x3b
	.long	0x38e
	.uleb128 0x10
	.byte	0
	.uleb128 0x1b
	.long	0x2ae
	.quad	.LBB34
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x18
	.long	0x3d5
	.uleb128 0x15
	.long	0x2be
	.long	.LLST4
	.uleb128 0x1c
	.quad	.LVL7
	.long	0x620
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	0x2ae
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.byte	0x1
	.byte	0x27
	.long	0x415
	.uleb128 0x15
	.long	0x2be
	.long	.LLST5
	.uleb128 0x1c
	.quad	.LVL9
	.long	0x639
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	0x2ae
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.byte	0x1
	.byte	0x2b
	.long	0x455
	.uleb128 0x15
	.long	0x2be
	.long	.LLST6
	.uleb128 0x1c
	.quad	.LVL13
	.long	0x639
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	0x2ae
	.quad	.LBB46
	.quad	.LBE46-.LBB46
	.byte	0x1
	.byte	0x1b
	.long	0x4a2
	.uleb128 0x15
	.long	0x2be
	.long	.LLST7
	.uleb128 0x1c
	.quad	.LVL15
	.long	0x620
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x73
	.sleb128 0
	.byte	0x31
	.byte	0x24
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	0x2ae
	.quad	.LBB48
	.quad	.LBE48-.LBB48
	.byte	0x1
	.byte	0x23
	.long	0x4ef
	.uleb128 0x15
	.long	0x2be
	.long	.LLST8
	.uleb128 0x1c
	.quad	.LVL17
	.long	0x620
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x73
	.sleb128 0
	.byte	0x31
	.byte	0x24
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	0x2ae
	.quad	.LBB50
	.quad	.LBE50-.LBB50
	.byte	0x1
	.byte	0x1f
	.long	0x53c
	.uleb128 0x15
	.long	0x2be
	.long	.LLST9
	.uleb128 0x1c
	.quad	.LVL19
	.long	0x620
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x73
	.sleb128 0
	.byte	0x31
	.byte	0x24
	.byte	0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL3
	.long	0x660
	.long	0x554
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL4
	.long	0x66b
	.uleb128 0x20
	.quad	.LVL5
	.long	0x677
	.uleb128 0x20
	.quad	.LVL21
	.long	0x683
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x96
	.uleb128 0x21
	.long	.LASF69
	.byte	0x1
	.byte	0x31
	.quad	.LFB73
	.quad	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.long	0x5f5
	.uleb128 0x22
	.string	"i"
	.byte	0x1
	.byte	0x31
	.long	0x3b
	.long	.LLST10
	.uleb128 0x23
	.long	0x2ae
	.quad	.LBB52
	.quad	.LBE52-.LBB52
	.byte	0x1
	.byte	0x31
	.uleb128 0x14
	.long	0x2be
	.uleb128 0xa
	.byte	0x3
	.quad	.LC8
	.byte	0x9f
	.uleb128 0x24
	.quad	.LVL24
	.long	0x620
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	.LASF55
	.byte	0x7
	.byte	0xa8
	.long	0x282
	.uleb128 0x25
	.long	.LASF56
	.byte	0x7
	.byte	0xa9
	.long	0x282
	.uleb128 0x26
	.long	.LASF57
	.byte	0x1
	.byte	0x7
	.long	0x3b
	.uleb128 0x9
	.byte	0x3
	.quad	MAX_LINE
	.uleb128 0x27
	.long	.LASF58
	.long	.LASF58
	.byte	0x2
	.byte	0x57
	.uleb128 0x28
	.uleb128 0xc
	.byte	0x9e
	.uleb128 0xa
	.byte	0x76
	.byte	0x61
	.byte	0x6c
	.byte	0x20
	.byte	0x3c
	.byte	0x20
	.byte	0x34
	.byte	0x30
	.byte	0xa
	.byte	0
	.uleb128 0x29
	.long	.LASF70
	.long	.LASF71
	.byte	0x9
	.byte	0
	.long	.LASF70
	.uleb128 0x28
	.uleb128 0x16
	.byte	0x9e
	.uleb128 0x14
	.byte	0x6c
	.byte	0x6f
	.byte	0x76
	.byte	0x65
	.byte	0x20
	.byte	0x69
	.byte	0x73
	.byte	0x20
	.byte	0x69
	.byte	0x6e
	.byte	0x20
	.byte	0x74
	.byte	0x68
	.byte	0x65
	.byte	0x20
	.byte	0x61
	.byte	0x69
	.byte	0x72
	.byte	0xa
	.byte	0
	.uleb128 0x27
	.long	.LASF59
	.long	.LASF59
	.byte	0x1
	.byte	0x14
	.uleb128 0x2a
	.long	.LASF60
	.long	.LASF60
	.byte	0x8
	.value	0x178
	.uleb128 0x2a
	.long	.LASF61
	.long	.LASF61
	.byte	0x8
	.value	0x176
	.uleb128 0x2b
	.long	.LASF72
	.long	.LASF72
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.quad	.LVL0
	.quad	.LVL0
	.value	0x1
	.byte	0x54
	.quad	.LVL0
	.quad	.LFE71
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL1
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL2
	.quad	.LFE72
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL1
	.quad	.LVL3-1
	.value	0x1
	.byte	0x54
	.quad	.LVL3-1
	.quad	.LFE72
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL6
	.quad	.LVL11
	.value	0x1
	.byte	0x53
	.quad	.LVL12
	.quad	.LFE72
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL6
	.quad	.LVL7
	.value	0xa
	.byte	0x3
	.quad	.LC1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL8
	.quad	.LVL10
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1579
	.sleb128 0
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL12
	.quad	.LVL13
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1608
	.sleb128 0
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL14
	.quad	.LVL16
	.value	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL16
	.quad	.LVL18
	.value	0xa
	.byte	0x3
	.quad	.LC4
	.byte	0x9f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL18
	.quad	.LVL20
	.value	0xa
	.byte	0x3
	.quad	.LC3
	.byte	0x9f
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL22
	.quad	.LVL23
	.value	0x1
	.byte	0x55
	.quad	.LVL23
	.quad	.LFE73
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
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
	.quad	.LFB72
	.quad	.LFE72-.LFB72
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB34
	.quad	.LBE34
	.quad	.LBB39
	.quad	.LBE39
	.quad	.LBB40
	.quad	.LBE40
	.quad	.LBB41
	.quad	.LBE41
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB72
	.quad	.LFE72
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF71:
	.string	"__builtin_puts"
.LASF58:
	.string	"__printf_chk"
.LASF45:
	.string	"_IO_FILE"
.LASF27:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF10:
	.string	"sizetype"
.LASF37:
	.string	"_offset"
.LASF67:
	.string	"add2"
.LASF21:
	.string	"_IO_write_ptr"
.LASF16:
	.string	"_flags"
.LASF23:
	.string	"_IO_buf_base"
.LASF28:
	.string	"_markers"
.LASF18:
	.string	"_IO_read_end"
.LASF14:
	.string	"time_t"
.LASF61:
	.string	"rand"
.LASF54:
	.string	"argv"
.LASF46:
	.string	"_IO_marker"
.LASF13:
	.string	"long long int"
.LASF62:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -O3 -funroll-loops -fstack-protector-strong"
.LASF36:
	.string	"_lock"
.LASF6:
	.string	"long int"
.LASF66:
	.string	"printf"
.LASF33:
	.string	"_cur_column"
.LASF49:
	.string	"_pos"
.LASF63:
	.string	"./simple_program2.c"
.LASF48:
	.string	"_sbuf"
.LASF32:
	.string	"_old_offset"
.LASF69:
	.string	"teste"
.LASF2:
	.string	"unsigned char"
.LASF53:
	.string	"argc"
.LASF4:
	.string	"signed char"
.LASF15:
	.string	"long long unsigned int"
.LASF1:
	.string	"unsigned int"
.LASF51:
	.string	"val1"
.LASF35:
	.string	"_shortbuf"
.LASF9:
	.string	"__off64_t"
.LASF70:
	.string	"puts"
.LASF20:
	.string	"_IO_write_base"
.LASF59:
	.string	"time"
.LASF64:
	.string	"/home/francis/Documents/ThesisWork/Instrumentation"
.LASF17:
	.string	"_IO_read_ptr"
.LASF24:
	.string	"_IO_buf_end"
.LASF12:
	.string	"char"
.LASF68:
	.string	"main"
.LASF47:
	.string	"_next"
.LASF38:
	.string	"__pad1"
.LASF39:
	.string	"__pad2"
.LASF40:
	.string	"__pad3"
.LASF41:
	.string	"__pad4"
.LASF42:
	.string	"__pad5"
.LASF3:
	.string	"short unsigned int"
.LASF50:
	.string	"__fmt"
.LASF0:
	.string	"long unsigned int"
.LASF22:
	.string	"_IO_write_end"
.LASF11:
	.string	"__time_t"
.LASF30:
	.string	"_fileno"
.LASF29:
	.string	"_chain"
.LASF8:
	.string	"__off_t"
.LASF26:
	.string	"_IO_backup_base"
.LASF55:
	.string	"stdin"
.LASF31:
	.string	"_flags2"
.LASF43:
	.string	"_mode"
.LASF19:
	.string	"_IO_read_base"
.LASF34:
	.string	"_vtable_offset"
.LASF44:
	.string	"_unused2"
.LASF25:
	.string	"_IO_save_base"
.LASF72:
	.string	"__stack_chk_fail"
.LASF52:
	.string	"val2"
.LASF57:
	.string	"MAX_LINE"
.LASF60:
	.string	"srand"
.LASF56:
	.string	"stdout"
.LASF65:
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
  movl $200, __fsrv_read
  movl $201, __fsrv_write
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
  movq __fsrv_write, %rdi       /* file desc */
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
  movq __fsrv_write, %rdi       /* file desc */
call write@PLT

  jmp  __afl_fork_wait_loop

__afl_fork_resume:

  /* In child process: close fds, resume execution. */

  movq $198, %rdi

  movq $(198 + 1), %rdi

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

  jmp __afl_return

.AFL_VARS:

  .lco