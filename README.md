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
		(find-as)
		   |
	      (edit-params)
		   |
		   V
		afl.as.c <------------- 
		   |                   |
         (add instrumentation)	       |
		   |                   |
		   V                   |
		afl.as.h - - -> (get assembly code)


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

# Instrumentation Code

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
	__afl_maybe_log:
		#if defined(__OpenBSD__)  || (defined(__FreeBSD__) && (__FreeBSD__ < 9))
		 .byte 0x9f /* lahf */
		#else
		 lahf
		#endif /* ^__OpenBSD__, etc */
		seto  %al
		/* Check if SHM region is already mapped. */
		movq  __afl_area_ptr(%rip), %rdx
		testq %rdx, %rdx   ; compare the two conditions
		je    __afl_setup  ; if the previous statement was true, we start setting up
	  
	```

- The variables are defined right at the end with 
	
	```
	.AFL_VARS:
	  	.lcomm   __afl_area_ptr, 8
	  	.lcomm   __afl_prev_loc, 8
	  	.lcomm   __afl_fork_pid, 4
	  	.lcomm   __afl_temp, 4
	  	.lcomm   __afl_setup_failure, 1
	  	.comm    __afl_global_area_ptr, 8, 8
	```

- .lcomm -> defines a local uninitialized block of storage of a number of bytes
- .comm -> allocates storage in the data secton. The storage is referenced by the identifier name. The first number is the size, the second is the alignment (optional).

# What We change

- How we choose the code to be instrumented:
	- Taking into consideration what was mentioned before hand, we have to decide the initial assembly line and the final line.
	  That block is the code block to be instrumented.
	- The initial decision of the first line is simple, since most of the work is arleady done by afl-gcc, the first line is simply the line they decide
          requires instrumentation, in other words, each branch decision and the two possible options from there on out. (it either does the jump or it doesn't)
	- The hard part was deciding what determines the end line.
	- To put it simply, there are three options:
		1. Either we simply find a new interesting line (one of the branch case mention before)
		2. We reach the end of the proc (.cfi_endproc), which symbolizes the end of the function, since the remaining lines are not code related
		3. Or none of the abovem which means there's nothing we can do but despair. This case hasn't been found yet. (check for ret)
	- This has yet to be tested to check if it covers 100% of the cases, but so far is enough for a good start


# Ideas
	- Check for function similarity without considering paths (perhaps only good for this iteration).

# Future Work
	- Better code to be hashed, there's still alot that can be done
		- For example, can we skip '.loc' lines?
	- Display the percentage of similiar code between the two in an efficient way.
	- Most importantly we need to figure out how to write to the bitmap




