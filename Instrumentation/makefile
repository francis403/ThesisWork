#Idea, make a program that gives the percentage of same code using afl-gcc
#CC=afl-clang-fast
#CC=afl-instr/instr-gcc
CC=afl-instr/instr-gcc
RUN=afl-instr/afl-fuzz
FLAGS= -static
EFLAGS= -fsanitize=address,undefined -fno-sanitize-recover=undefined -g -O0
BASE_FLAGS= -fsanitize=address -g
EXE=simple
EXE2=simple2
HARN=harn
FACT=fact
ALL=afl-instr/instr-all-gcc

main: clean simple simple2 fuzz

cmp_progs: clean instr-all fuzz

#------------------------ OTHER -------------------------#
simple:
	$(CC) ./simple_program.c -save-temps -o $(EXE) -w

simple2:
	$(CC) ./simple_program2.c -save-temps -o $(EXE2) -w

harness: 
	$(CC) $(EFLAGS) ./harness.c vul.c -save-temps -o $(HARN) -w

factorial:
	$(CC) ./find_factorial.c -save-temps -o $(FACT) -w
fuzz:
	#$(RUN) -m none -i input -o out ./fact ./simple2
	$(RUN) -m none -i input -o out -q 2 ./simple ./simple2
	#$(RUN) -m none -i input -o out ./fact ./simple2
	#$(RUN) -m none -i input -o out ./simple
	#$(RUN) -m none -i input -o out ./fact
	#$(RUN) -m none -i input -o out ./is_prime

cmp_progs: clean instr-all fuzz

instr-all: clean
	#$(ALL) -p ./find_factorial.c -save-temps -o $(FACT) -w -p ./simple_program2.c -save-temps -o $(EXE2) -w
	$(ALL) -p ./simple_program.c -save-temps -o $(EXE) -w -p ./simple_program2.c -save-temps -o $(EXE2) -w
	#$(ALL) -p ./simple_program.c -save-temps -o $(EXE) -w
	#$(ALL) -p ./find_factorial.c -save-temps -o $(FACT) -w
	#$(ALL) -p ./is_prime.c -save-temps -o is_prime -w


valgrind:
	valgrind --leak-check=full ./$(ALL)
test_memory:
	valgrind --leak-check=full -v afl-instr/afl-fuzz -m none -i input -o out ./is_prime


#--------CLEANING---------

clean: remExecutable remDir

remExecutable:
	rm -f a.out $(EXE) $(EXE2) $(FACT) $(HARN)

remDir:
	rm -f -r crash-* out* a.out *.i *.o *.s

# ASAN_OPTIONS COMMANDS
#export ASAN_OPTIONS="detect_leaks=0:abort_on_error=1:symbolize=0:allocator_may_return_null=1"
