#SIMPLE OVERFLOW PROVEN TO WORK BY THE FUZZER
#CC=afl-clang-fast
CC=afl-gcc
CC_fast=afl-clang-fast
CC_fast2=afl-clang-fast2
DELTA_INSTR_FAST=../../Instrumentation/afl-instr/$(CC_fast)
DELTA_INSTR_FAST2=../../Instrumentation/afl-instr/$(CC_fast2)
DELTA_RUN=../../Instrumentation/afl-instr/afl-fuzz
FLAGS= -static
#EFLAGS= -fsanitize=address,undefined -fno-sanitize-recover=undefined,integer -g -O0
EFLAGS= -fsanitize=address,undefined -fno-sanitize-recover=undefined -g -O0
BASE_FLAGS= -fsanitize=address -g
EXE=./harn
EXE2=./harn2

#main: harness afl

main: harness afl

main-delta:	clean harness-delta harness-delta2 afl-delta

persistent_afl: harness_p afl

lib: libFuzzTest libExecute

aflTwoCore: harness master slave

#-----------------------

harness: 
	$(CC) $(EFLAGS) ./harness.c vul.c -o $(EXE) -w

harness-delta: 
	$(DELTA_INSTR_FAST) $(EFLAGS) ./harness.c vul.c -o $(EXE) -w

harness-delta2: 
	$(DELTA_INSTR_FAST2) $(EFLAGS) ./harness2.c vul.c -o $(EXE2) -w

harness_p: 
	$(CC) $(EFLAGS) ./harness_persistent.c vul.c -o $(EXE) -w

harness_gcc:
	gcc -fsanitize=address -Wall -g ./harness.c vul.c -o $(EXE) -w

harness_clang:
	clang -fsanitize=address -Wall -g ./harness.c vul.c -o $(EXE) -w

valgrind: harness_gcc 
	valgrind --leak-check=full ./$(EXE)

afl:
	afl-fuzz -m none -i in -o out ./$(EXE)

afl-delta:
	$(DELTA_RUN) -m none -i in -o out -q 2 -p $(EXE) -p $(EXE2)

ASAN_OPT:
	ASAN_OPTIONS='detect_leaks=1:leak_check_at_exit=1:abort_on_error=1:symbolize=0'

#-----ONLY RUN IF YOU HAVE MORE THAN 1 CORE
master:
	afl-fuzz -i in -o out -M master ./$(EXE)
slave:
	afl-fuzz -i in -o out -S slave1 ./$(EXE)

#---------------------------------------------#
libFuzz:
	clang++ -g -O1 -fsanitize=fuzzer,signed-integer-overflow -fsanitize-coverage=trace-pc-guard first_fuzzer.cc

libFuzzTest:
	clang++ -g -std=c++11 -fsanitize=address -fsanitize-coverage=trace-pc-guard \
    first_fuzzer.cc ../../../libFuzzer/libFuzzer.a \
    -o first_fuzzer
libExecute:
	./first_fuzzer corpus1


#------------------------ OTHER -------------------------#
simple:
	$(CC) $(EFLAGS) ./simple_program.c -o simple -w

#--------CLEANING---------

clean: remExecutable remDir

remExecutable:
	rm -f a.out first_fuzzer harn harn2

remDir:
	rm -f -r crash-* out* a.out

# ASAN_OPTIONS COMMANDS
#export ASAN_OPTIONS="detect_leaks=0:abort_on_error=1:symbolize=0:allocator_may_return_null=1"
