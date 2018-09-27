#SIMPLE OVERFLOW PROVEN TO WORK BY THE FUZZER
CC=afl-clang-fast
FLAGS= -static
EXE=harn

main: harness afl

lib: libFuzzTest libExecute

#-----------------------

harness: 
	$(CC) $(FLAGS) ./harness.c vul.c -o $(EXE) -w

afl:
	afl-fuzz -i in -o out ./$(EXE)
libFuzz:
	clang++ -g -O1 -fsanitize=fuzzer,signed-integer-overflow -fsanitize-coverage=trace-pc-guard first_fuzzer.cc

libFuzzTest:
	clang++ -g -std=c++11 -fsanitize=address -fsanitize-coverage=trace-pc-guard \
    first_fuzzer.cc ../../../libFuzzer/libFuzzer.a \
    -o first_fuzzer
libExecute:
	./first_fuzzer corpus1
