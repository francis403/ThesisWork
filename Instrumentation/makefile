#Idea, make a program that gives the percentage of same code using afl-gcc
#CC=afl-clang-fast
CC=afl-instr/instr-gcc
FLAGS= -static
EFLAGS= -fsanitize=address,undefined -fno-sanitize-recover=undefined -g -O0
BASE_FLAGS= -fsanitize=address -g
EXE=simple


#------------------------ OTHER -------------------------#
simple:
	$(CC) $(EFLAGS) ./simple_program.c -o $(EXE) -w

#--------CLEANING---------

clean: remExecutable remDir

remExecutable:
	rm -f a.out $(EXE)

remDir:
	rm -f -r crash-* out* a.out

# ASAN_OPTIONS COMMANDS
#export ASAN_OPTIONS="detect_leaks=0:abort_on_error=1:symbolize=0:allocator_may_return_null=1"
