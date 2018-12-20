#Idea, make a program that gives the percentage of same code using afl-gcc
#CC=afl-clang-fast
#CC=afl-instr/instr-gcc
CC=test_folder/instr-gcc
RUN=test_folder/afl-fuzz
FLAGS= -static
EFLAGS= -fsanitize=address,undefined -fno-sanitize-recover=undefined -g -O0
BASE_FLAGS= -fsanitize=address -g
EXE=simple
EXE2=simple2

main: clean simple fuzz

#------------------------ OTHER -------------------------#
simple:
	$(CC) ./simple_program.c -save-temps -o $(EXE) -w

fuzz:
	$(RUN) -m none -i input -o out ./simple ./simple

#--------CLEANING---------

clean: remExecutable remDir

remExecutable:
	rm -f a.out $(EXE)

remDir:
	rm -f -r crash-* out* a.out

# ASAN_OPTIONS COMMANDS
#export ASAN_OPTIONS="detect_leaks=0:abort_on_error=1:symbolize=0:allocator_may_return_null=1"
