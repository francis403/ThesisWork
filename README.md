# ThesisWork

# How the random id is generated

-Notes:
	- Done in afl.as.c in the main function
	- Done before the add instrumentation function
-Code:
	/*
	gettimeofday(&tv, &tz);
	rand_seed = tv.tv_sec ^ tv.tv_usec ^ getpid();
	srandom(rand_seed);
	*/

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
