	.file	"simple_program.c"
	.text
.Ltext0:
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.section	.text.startup,"ax",@progbits
.LHOTB0:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.section	.text.startup
	.globl	main
	.type	main, @function
main:
.LFB71:
	.file 1 "./simple_program.c"
	.loc 1 9 0
	.cfi_startproc
.LVL0:
	.loc 1 14 0

/* --- AFL TRAMPOLINE (64-BIT) --- */

.align 4

leaq -(128+24)(%rsp), %rsp
movq %rdx,  0(%rsp)
movq %rcx,  8(%rsp)
movq %rax, 16(%rsp)
movq $0x00000c05, %rcx
movl $0x00000c05, __afl_block_temp
call __afl_maybe_log
movq 16(%rsp), %rax
movq  8(%rsp), %rcx
movq  0(%rsp), %rdx
leaq (128+24)(%rsp), %rsp

/* --- END --- */

	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE71:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE0:
	.section	.text.startup
.LHOTE0:
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
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2f7
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF53
	.byte	0xc
	.long	.LASF54
	.long	.LASF55
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
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
	.byte	0x3
	.byte	0x83
	.long	0x65
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
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
	.uleb128 0x7
	.long	.LASF43
	.byte	0xd8
	.byte	0x4
	.byte	0xf1
	.long	0x223
	.uleb128 0x8
	.long	.LASF14
	.byte	0x4
	.byte	0xf2
	.long	0x3b
	.byte	0
	.uleb128 0x8
	.long	.LASF15
	.byte	0x4
	.byte	0xf7
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF16
	.byte	0x4
	.byte	0xf8
	.long	0x8b
	.byte	0x10
	.uleb128 0x8
	.long	.LASF17
	.byte	0x4
	.byte	0xf9
	.long	0x8b
	.byte	0x18
	.uleb128 0x8
	.long	.LASF18
	.byte	0x4
	.byte	0xfa
	.long	0x8b
	.byte	0x20
	.uleb128 0x8
	.long	.LASF19
	.byte	0x4
	.byte	0xfb
	.long	0x8b
	.byte	0x28
	.uleb128 0x8
	.long	.LASF20
	.byte	0x4
	.byte	0xfc
	.long	0x8b
	.byte	0x30
	.uleb128 0x8
	.long	.LASF21
	.byte	0x4
	.byte	0xfd
	.long	0x8b
	.byte	0x38
	.uleb128 0x8
	.long	.LASF22
	.byte	0x4
	.byte	0xfe
	.long	0x8b
	.byte	0x40
	.uleb128 0x9
	.long	.LASF23
	.byte	0x4
	.value	0x100
	.long	0x8b
	.byte	0x48
	.uleb128 0x9
	.long	.LASF24
	.byte	0x4
	.value	0x101
	.long	0x8b
	.byte	0x50
	.uleb128 0x9
	.long	.LASF25
	.byte	0x4
	.value	0x102
	.long	0x8b
	.byte	0x58
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.value	0x104
	.long	0x25b
	.byte	0x60
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.value	0x106
	.long	0x261
	.byte	0x68
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.value	0x108
	.long	0x3b
	.byte	0x70
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.value	0x10c
	.long	0x3b
	.byte	0x74
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.value	0x10e
	.long	0x6c
	.byte	0x78
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.value	0x112
	.long	0x50
	.byte	0x80
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.value	0x113
	.long	0x57
	.byte	0x82
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.value	0x114
	.long	0x267
	.byte	0x83
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.value	0x118
	.long	0x277
	.byte	0x88
	.uleb128 0x9
	.long	.LASF35
	.byte	0x4
	.value	0x121
	.long	0x77
	.byte	0x90
	.uleb128 0x9
	.long	.LASF36
	.byte	0x4
	.value	0x129
	.long	0x89
	.byte	0x98
	.uleb128 0x9
	.long	.LASF37
	.byte	0x4
	.value	0x12a
	.long	0x89
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF38
	.byte	0x4
	.value	0x12b
	.long	0x89
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF39
	.byte	0x4
	.value	0x12c
	.long	0x89
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x4
	.value	0x12e
	.long	0x29
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF41
	.byte	0x4
	.value	0x12f
	.long	0x3b
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF42
	.byte	0x4
	.value	0x131
	.long	0x27d
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF56
	.byte	0x4
	.byte	0x96
	.uleb128 0x7
	.long	.LASF44
	.byte	0x18
	.byte	0x4
	.byte	0x9c
	.long	0x25b
	.uleb128 0x8
	.long	.LASF45
	.byte	0x4
	.byte	0x9d
	.long	0x25b
	.byte	0
	.uleb128 0x8
	.long	.LASF46
	.byte	0x4
	.byte	0x9e
	.long	0x261
	.byte	0x8
	.uleb128 0x8
	.long	.LASF47
	.byte	0x4
	.byte	0xa2
	.long	0x3b
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22a
	.uleb128 0x6
	.byte	0x8
	.long	0xa6
	.uleb128 0xb
	.long	0x91
	.long	0x277
	.uleb128 0xc
	.long	0x82
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x223
	.uleb128 0xb
	.long	0x91
	.long	0x28d
	.uleb128 0xc
	.long	0x82
	.byte	0x13
	.byte	0
	.uleb128 0xd
	.long	.LASF57
	.byte	0x1
	.byte	0x9
	.long	0x3b
	.quad	.LFB71
	.quad	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.long	0x2c9
	.uleb128 0xe
	.long	.LASF48
	.byte	0x1
	.byte	0x9
	.long	0x3b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xe
	.long	.LASF49
	.byte	0x1
	.byte	0x9
	.long	0x2c9
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x8b
	.uleb128 0xf
	.long	.LASF50
	.byte	0x5
	.byte	0xa8
	.long	0x261
	.uleb128 0xf
	.long	.LASF51
	.byte	0x5
	.byte	0xa9
	.long	0x261
	.uleb128 0x10
	.long	.LASF52
	.byte	0x1
	.byte	0x7
	.long	0x3b
	.uleb128 0x9
	.byte	0x3
	.quad	MAX_LINE
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
	.uleb128 0xe
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB71
	.quad	.LFE71-.LFB71
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB71
	.quad	.LFE71
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF17:
	.string	"_IO_read_base"
.LASF54:
	.string	"./simple_program.c"
.LASF4:
	.string	"signed char"
.LASF16:
	.string	"_IO_read_end"
.LASF7:
	.string	"size_t"
.LASF43:
	.string	"_IO_FILE"
.LASF18:
	.string	"_IO_write_base"
.LASF22:
	.string	"_IO_buf_end"
.LASF19:
	.string	"_IO_write_ptr"
.LASF53:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -O3 -funroll-loops -fstack-protector-strong"
.LASF51:
	.string	"stdout"
.LASF27:
	.string	"_chain"
.LASF6:
	.string	"long int"
.LASF35:
	.string	"_offset"
.LASF41:
	.string	"_mode"
.LASF9:
	.string	"__off64_t"
.LASF28:
	.string	"_fileno"
.LASF23:
	.string	"_IO_save_base"
.LASF2:
	.string	"unsigned char"
.LASF44:
	.string	"_IO_marker"
.LASF0:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF50:
	.string	"stdin"
.LASF25:
	.string	"_IO_save_end"
.LASF56:
	.string	"_IO_lock_t"
.LASF26:
	.string	"_markers"
.LASF57:
	.string	"main"
.LASF29:
	.string	"_flags2"
.LASF46:
	.string	"_sbuf"
.LASF30:
	.string	"_old_offset"
.LASF34:
	.string	"_lock"
.LASF1:
	.string	"unsigned int"
.LASF31:
	.string	"_cur_column"
.LASF13:
	.string	"long long unsigned int"
.LASF21:
	.string	"_IO_buf_base"
.LASF45:
	.string	"_next"
.LASF32:
	.string	"_vtable_offset"
.LASF48:
	.string	"argc"
.LASF10:
	.string	"sizetype"
.LASF42:
	.string	"_unused2"
.LASF12:
	.string	"long long int"
.LASF11:
	.string	"char"
.LASF15:
	.string	"_IO_read_ptr"
.LASF20:
	.string	"_IO_write_end"
.LASF5:
	.string	"short int"
.LASF24:
	.string	"_IO_backup_base"
.LASF14:
	.string	"_flags"
.LASF49:
	.string	"argv"
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
.LASF47:
	.string	"_pos"
.LASF8:
	.string	"__off_t"
.LASF52:
	.string	"MAX_LINE"
.LASF55:
	.string	"/home/francis/Documents/ThesisWork/Instrumentation"
.LASF33:
	.string	"_shortbuf"
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
  m