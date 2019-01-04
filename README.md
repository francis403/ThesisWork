# ThesisWork

# How the random id is generated

- The random id generation and addage to the instrumentation is done in two files.
- The function is defined in types.h as R(x)


	```
	#ifdef AFL_LLVM_PASS
	#  define AFL_R(x) (random() % (x))
	#else
	#  define R(x) (random() % (x))
	#endif /* ^AFL_LLVM_PASS */
	```

- It is then used in instr-as.c to add to the trampoline code, described further ahead.

	```
	fprintf(outf, use_64bit ? trampoline_fmt_64 : trampoline_fmt_32,
              R(MAP_SIZE));
	```
- The trampoline variable as a %08x that will hold the randomly generated value displayed as a hex
-  MAP_SIZE is defined in config.h
	- MAP_SIZE = 2 ^ MAP_SIZE_POW2
	- Where MAP_SIZE_POW2 is defines with a default of 16 in config.h

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
		/* --- AFL TRAMPOLINE (64-BIT) --- */
		
		.align 4
	
		leaq -(128+24)(%%rsp), %%rsp ; double %% is only to name the registers;
		movq %%rdx,  0(%%rsp) ; load rdx into the beggining of the stack
		movq %%rcx,  8(%%rsp) ; move the rcx into the stack[1]
		movq %%rax, 16(%%rsp) ; move rax into the stack[2]
		movq $0x%08x, %%rcx ; adds the random id here
		call __afl_maybe_log ; call the first function in the main payload
		movq 16(%%rsp), %%rax
		movq  8(%%rsp), %%rcx
		movq  0(%%rsp), %%rdx
		leaq (128+24)(%%rsp), %%rsp
		
		/* --- END --- */
		```

-leaq (address expression), register -> compute the address expression and change the register value to that

- It calls __afl_maybe_log, available in the main_payload, to add and check if the region is arleady mapped.

- This is the main_payload (64 bits) added at the end of the assembly code, since it's a very big piece of code, only the important parts will be added

	```
	__afl_maybe_log:
		#if defined(__OpenBSD__)  || (defined(__FreeBSD__) && (__FreeBSD__ < 9))
		 .byte 0x9f /* lahf */
		#else
		 lahf ;Load Flags into AH register
		#endif /* ^__OpenBSD__, etc */
		seto  %al ; sets the byte in the operand to 1 if the overflow Flag is set, else 0
		/* Check if SHM region is already mapped. */
		movq  __afl_area_ptr(%rip), %rdx
		testq %rdx, %rdx   ; compare the two conditions, equivalent to cmp %rdx,0
		je    __afl_setup  ; if the previous statement was true, we start setting up
	  
	```

- right after this bit of code, comes this one: (adds it if its not the first time seing the block)

	```
	__afl_store: (after this is ran, we go to afl_return)
		/* Calculate and store hit for the code location specified in rcx. */
		#ifndef COVERAGE_ONLY
			xorq __afl_prev_loc(%rip), %rcx
			xorq %rcx, __afl_prev_loc(%rip)
			shrq $1, __afl_prev_loc(%rip)
		#endif /* ^!COVERAGE_ONLY */
		#ifdef SKIP_COUNTS
			orb  $1, (%rdx, %rcx, 1)
		#else
			incb (%rdx, %rcx, 1)
		#endif /* ^SKIP_COUNTS */
		```
- It's immediatly followed by afl_return

	```
	 __afl_return:
		addb $127, %al   ; no idea what this is doing
		#if defined(__OpenBSD__)  || (defined(__FreeBSD__) && (__FreeBSD__ < 9))
			.byte 0x9e /* sahf */
		#else
			sahf
		#endif /* ^__OpenBSD__, etc */
			ret  ; return to the trampoline code
	```

- we only jump to __afl_setup if we never encountered the previous code block
	- So in this code block we have to store the range of times we've been to this block (> 1)

- This here block only happens if its the first time we've hit the block
	
	```
	__afl_setup:
		/* Do not retry setup if we had previous failures. */
		cmpb $0, __afl_setup_failure(%rip)
		jne __afl_return
		/* Check out if we have a global pointer on file. */
		#ifndef __APPLE__
		  movq  __afl_global_area_ptr@GOTPCREL(%rip), %rdx ;global adress to rdx
		  movq  (%rdx), %rdx
		#else
		  movq  __afl_global_area_ptr(%rip), %rdx
		#endif /* !^__APPLE__ */
		  testq %rdx, %rdx ; check if there's nothing in %rdx
		  je    __afl_setup_first ; if there is nothing it's the first time
		  movq %rdx, __afl_area_ptr(%rip) ; move to the area pointer
		  jmp  __afl_store	; jump to the previously defined segment
	```
	

- The last important code block, and biggest, is:

	```
	"__afl_setup_first:\n"
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
		  /*Map SHM, jumping to __afl_setup_abort if something goes wrong. */

		  /* The 64-bit ABI requires 16-byte stack alignment. We'll keep the
		  original stack ptr in the callee-saved r12. */

		  pushq %r12
		  movq  %rsp, %r12
		  subq  $16, %rsp
		  andq  $0xfffffffffffffff0, %rsp

		  leaq .AFL_SHM_ENV(%rip), %rdi
		  CALL_L64("getenv") ; defined in afl-as.h

		  testq %rax, %rax
		  je    __afl_setup_abort

		  movq  %rax, %rdi
		  CALL_L64("atoi")

		  xorq %rdx, %rdx   /* shmat flags    */
		  xorq %rsi, %rsi   /* requested addr */
		  movq %rax, %rdi   /* SHM ID         */
		  CALL_L64("shmat")

		  cmpq $-1, %rax
		  je   __afl_setup_abort

		  /* Store the address of the SHM region. */

		  movq %rax, %rdx
		  movq %rax, __afl_area_ptr(%rip) ; moves the value to the area ptr pointer

		#ifdef __APPLE__
		  movq %rax, __afl_global_area_ptr(%rip)
		#else
		  movq __afl_global_area_ptr@GOTPCREL(%rip), %rdx
		  movq %rax, (%rdx)
		#endif /* ^__APPLE__ */
		  movq %rax, %rdx
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

# Hypothesis not yet proven
	- In the code the register rdx always points the area (it's the area ptr)

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


# What we know about afl-fuzz.c

	# Interesting Variables

		```
		EXP_ST u8* trace_bits;                /* SHM with instrumentation bitmap  */
		EXP_ST u8  virgin_bits[MAP_SIZE],     /* Regions yet untouched by fuzzing */
			virgin_tmout[MAP_SIZE],    /* Bits we haven't seen in tmouts   */
			virgin_crash[MAP_SIZE];    /* Bits we haven't seen in crashes  */
		static u8  var_bytes[MAP_SIZE];       /* Bytes that appear to be variable */
		static s32 shm_id;                    /* ID of the SHM region             */
		```	

	# Functions
		- has_new_bits -> checks if the current execution path brings anything new to the 					table
		- calibrate_case ->
		- update_bitmap_score -> called whenever we bump into a new path
		- calculate_score -> calculate case desirability
		- cull_queue -> goes over the top_rated[] entries, and then sequentially grabs
			 winners for previously_unseed bytes

# Notes:
	- General Purpose Registers: (RAX, RBX, RCX, RDX, RBP, RSP and R8-R15)
	- In afl-fuzz.c, in the function cull_queue, they use a temp_v file to check against the 
	bitmap for uncaptured parts (if yes and it was a top_rated[] contender, they use it)
	- in afl-fuzz.c we have update_bitmap_score function, called whenver we bump into a new path
		- they maintain a list top_rated[] entries for every byte in the bitmap.
	- the calibrate_case function in afl-fuzz is the one that hashes nad checks if its a new path
	- uses att syntax (.att_syntax)

# Ideas
	- Check for function similarity without considering paths (perhaps only good for this iteration).

# Future Work
	- Better code to be hashed, there's still alot that can be done
		- For example, can we skip '.loc' lines?
	- Display the percentage of similiar code between the two in an efficient way.
	- Most importantly we need to figure out how to write to the bitmap
	- Add personalized ids and change the way AFL finds edges, this is, 
	  we care more if the path is the same than the edge itself


# Questions
	- How does AFL identify the number of times it hit the code blocks?
	- How does AFL add the code block to the bitmap
	- Can we access it in any way?
	- What exactly is in %%rdx, rcx, raz when we reach the code block?
	- How does the fuzzing take advantage of the instrumentation?
	- How do we put the id of the block into the shared memory? -done
	- Where is the random ID being generated? - done


