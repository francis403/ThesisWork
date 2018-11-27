# ThesisWork

# How the random id is generated

-Notes:
	- Done in afl.as.c in the main function
	- Done before the add instrumentation function
- TODO:




srandom: The srandom(unsigned int seed), included in stdlib.h, function uses a nonlinear additive feedback random number generator employing default table of size 31 long integers to return successive pseudo-random numbers in the range from 0 to RAND_MAX.

# What they want to catch with the intstrumentation

		compiler
		   |
		   |
		   V
		afl.as.c
		   |
         (add instrumentation)
		   |
		   V
		afl.as.h


- Important Notes:	
	- Added to the assembly code in afl-as.c
	- They add the assembly declared in the variables in afl.as.h
	- Afl-as.c is automatically invoked in afl-gcc/afl-clang
	- Instrumenting, check for function names or conditional labels.
	- the instrumentation does shm_trace_map[cur_loc ^ prev_loc]++

- In essence, they want to catch:

         ^main:      - function entry point (always instrumented)
         ^.L0:       - GCC branch label
         ^.LBB0_0:   - clang branch label (but only in clang mode)
         ^\tjnz foo  - conditional branches

       ...but not:

         ^# BB#0:    - clang comments
         ^ # BB#0:   - ditto
         ^.Ltmp0:    - clang non-branch labels
         ^.LC0       - GCC non-branch labels
         ^.LBB0_0:   - ditto (when in GCC mode)
         ^\tjmp foo  - non-conditional jumps



- How it works:

	1. They open the resulting assembly file (from compilation of the program) and pass through 	each line checking if they should add the instrumentation
	2. They do this in two ways, first, before adding the normal line, they check if the line itself is important (without the need of a label), then they check if the line is a jump, if is is they add it.
	2.5. Conditional branch instruction (jnz, etc). They append the instrumentation
       right after the branch (to instrument the not-taken path) and at the
       branch destination label (handled later on) 
	3. They do this until they pass through the entire file
	4. At the end, they add the main_payload once, which is what contains the logic (the before added instrumentation is basically a jump condition to this code)

- Notes
	- Skip Intel blocks, resume instrumentation when back to AT&T
	- Skip section, bss, data
	- only want to instrument the .text section.
	- Detects and skips ad-hoc __asm__ blocks, skipping them.

#Instrumentation Code

- In this section I'll present all the instrumentation code, along with its explanation

- This is the Trampoline code, added to the begginging and end of each brach condition
		```
		"\n"
		"/* --- AFL TRAMPOLINE (64-BIT) --- */\n"
		"\n"
		".align 4\n"
		"\n"
		"leaq -(128+24)(%%rsp), %%rsp\n"
		"movq %%rdx,  0(%%rsp)\n"
		"movq %%rcx,  8(%%rsp)\n"
		"movq %%rax, 16(%%rsp)\n"
		"movq $0x%08x, %%rcx\n"
		"call __afl_maybe_log\n"
		"movq 16(%%rsp), %%rax\n"
		"movq  8(%%rsp), %%rcx\n"
		"movq  0(%%rsp), %%rdx\n"
		"leaq (128+24)(%%rsp), %%rsp\n"
		"\n"
		"/* --- END --- */\n"
		"\n";
		```
- It calls __afl_maybe_log, available in the main_payload, to add and check if the region is arleady mapped.

- This is the main_payload added at the end of the assembly code, since it's a very big piece of code, only the important parts will be added

	```
	"__afl_maybe_log:\n"
	  "\n"
	#if defined(__OpenBSD__)  || (defined(__FreeBSD__) && (__FreeBSD__ < 9))
	  "  .byte 0x9f /* lahf */\n"
	#else
	  "  lahf\n"
	#endif /* ^__OpenBSD__, etc */
	  "  seto  %al\n"
	  "\n"
	  "  /* Check if SHM region is already mapped. */\n"
	  "\n"
	  "  movq  __afl_area_ptr(%rip), %rdx\n"
	  "  testq %rdx, %rdx\n"
	  "  je    __afl_setup\n"
	  "\n"
	  "__afl_store:\n"
	  "\n"
	  "  /* Calculate and store hit for the code location specified in rcx. */\n"
	  "\n"
	#ifndef COVERAGE_ONLY
	  "  xorq __afl_prev_loc(%rip), %rcx\n"
	  "  xorq %rcx, __afl_prev_loc(%rip)\n"
	  "  shrq $1, __afl_prev_loc(%rip)\n"
	#endif /* ^!COVERAGE_ONLY */
	  "\n"
	#ifdef SKIP_COUNTS
	  "  orb  $1, (%rdx, %rcx, 1)\n"
	#else
	  "  incb (%rdx, %rcx, 1)\n"
	#endif /* ^SKIP_COUNTS */
	  "\n"
	  "__afl_return:\n"
	  "\n"
	  "  addb $127, %al\n"
	#if defined(__OpenBSD__)  || (defined(__FreeBSD__) && (__FreeBSD__ < 9))
	  "  .byte 0x9e /* sahf */\n"
	#else
	  "  sahf\n"
	#endif /* ^__OpenBSD__, etc */
	  "  ret\n"
	  "\n"
	  ".align 8\n"
	  "\n"
	  "__afl_setup:\n"
	  "\n"
	  "  /* Do not retry setup if we had previous failures. */\n"
	  "\n"
	  "  cmpb $0, __afl_setup_failure(%rip)\n"
	  "  jne __afl_return\n"
	  "\n"
	  "  /* Check out if we have a global pointer on file. */\n"
	  "\n"
	```




