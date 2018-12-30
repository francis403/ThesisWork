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
HARN=harn
FACT=fact
ALL=test_folder/instr-all-gcc

main: clean simple simple2 harness fuzz

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
	$(RUN) -m none -i input -o out ./fact ./simple2
	#$(RUN) -m none -i input -o out ./simple ./simple2
	#$(RUN) -m none -i input -o out ./fact ./simple2

cmp_progs: clean instr-all fuzz

instr-all:
	$(ALL) -p ./find_factorial.c -save-temps -o $(FACT) -w -p ./simple_program2.c -save-temps -o $(EXE2) -w
	#$(ALL) -p ./simple_program.c -save-temps -o $(EXE) -w -p ./simple_program2.c -save-temps -o $(EXE2) -w


valgrind:
	valgrind --leak-check=full ./$(ALL)
test_memory:
	valgrind --leak-check=full test_folder/afl-fuzz -m none -i input -o out ./fact ./simple2


#--------CLEANING---------

clean: remExecutable remDir

remExecutable:
	rm -f a.out $(EXE) $(EXE2)

remDir:
	rm -f -r crash-* out* a.out *.i *.o *.s

# ASAN_OPTIONS COMMANDS
#export ASAN_OPTIONS="detect_leaks=0:abort_on_error=1:symbolize=0:allocator_may_return_null=1"
