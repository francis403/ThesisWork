#SIMPLE OVERFLOW PROVEN TO WORK BY THE FUZZER
CC=afl-clang-fast
FLAGS= -static
EFLAGS= -fsanitize=address,signed-integer-overflow,alignment -fno-sanitize-recover=undefined
EXE=harn

main: harness afl

persistent_afl: harness_p afl

lib: libFuzzTest libExecute

aflTwoCore: harness master slave
	

#-----------------------

harness: 
	$(CC) $(EFLAGS) ./harness.c vul.c -o $(EXE) -w

harness_p: 
	$(CC) $(EFLAGS) ./harness_persistent.c vul.c -o $(EXE) -w

afl:
	afl-fuzz -m none -i in -o out ./$(EXE)

#-----ONLY RUN IF YOU HAVE MORE THAN 1 CORE
master:
	afl-fuzz -i in -o out -M master ./$(EXE)
slave:
	afl-fuzz -i in -o out -S slave1 ./$(EXE)

libFuzz:
	clang++ -g -O1 -fsanitize=fuzzer,signed-integer-overflow -fsanitize-coverage=trace-pc-guard first_fuzzer.cc

libFuzzTest:
	clang++ -g -std=c++11 -fsanitize=address -fsanitize-coverage=trace-pc-guard \
    first_fuzzer.cc ../../../libFuzzer/libFuzzer.a \
    -o first_fuzzer
libExecute:
	./first_fuzzer corpus1


#--------CLEANING---------

clean: remExecutable remDir

remExecutable:
	rm -f a.out first_fuzzer harn

remDir:
	rm -f -r crash-* out* a.out
