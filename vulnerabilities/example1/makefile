#SIMPLE OVERFLOW PROVEN TO WORK BY THE FUZZER
CC=afl-clang-fast
FLAGS= -static
EXE=harn
harness: 
	$(CC) -s ./harness.c vul.c -o $(EXE) -w

#-----------------------

afl:
	afl-fuzz -i in -o out ./$(EXE)

