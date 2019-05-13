#!/bin/bash

#To run the script
#example: ./scriptedFuzzerTesting.sh ../datasets/libxml2/xmllint .

# Gonna try making this one for libxml

#Before running the scripts give full permission to it!
# chmod +x name_of_script.sh

run_prog(){

	mkdir $TEST_DIR

	while [ $TEST_NUMBR -le $NUMBR_OF_TESTS ]
do
	echo "Starting fuzzing process number $TEST_NUMBR"
	mkdir "$TEST_DIR/test$TEST_NUMBR"
	mkdir "$TEST_DIR/test$TEST_NUMBR/in"
	echo "" > "$TEST_DIR/test$TEST_NUMBR/in/test"
	rm -rf "$TEST_DIR/test$TEST_NUMBR/out"
	if [ $TEST_NUMBR -eq 1 ]; then
		#(timeout "$TIME_PER_TEST"h $FUZZER_EXE -i $TEST_DIR/test$TEST_NUMBR/in -o $TEST_DIR/test$TEST_NUMBR/out -p $PROG_RUN)&
		#(command)&
		(eval $COMMAND)&
		#"$COMMAND"&
		#"$COMMAND"&
	elif [ $TEST_NUMBR -eq $NUMBR_OF_TESTS ]; then
		#(timeout "$TIME_PER_TEST"h $FUZZER_EXE -S test -i $OUTDIR/test$TEST_NUMBR/in -o $OUTDIR/test$TEST_NUMBR/out $PROG_RUN)
		break
	else 
		#(timeout "$TIME_PER_TEST"h $FUZZER_EXE -i $TEST_DIR/test$TEST_NUMBR/in -o $TEST_DIR/test$TEST_NUMBR/out -p $PROG_RUN) &>/dev/null &
		#"$COMMAND"&>/dev/null &
		(eval $COMMAND)&>/dev/null &
		#(command)&>/dev/null &
	fi
	((TEST_NUMBR++))
	COMMAND="$FUZZER_EXE -q 1 -i $TEST_DIR/test$TEST_NUMBR/in -o $TEST_DIR/test$TEST_NUMBR/out $PROGS"
done
(eval $COMMAND)
#command
#(timeout "$TIME_PER_TEST"h $FUZZER_EXE -i $TEST_DIR/test$TEST_NUMBR/in -o $TEST_DIR/test$TEST_NUMBR/out -p $PROG_RUN)
pid=$!

wait $pid

#Generate all index.html
TEST_NUMBR=1
while [ $TEST_NUMBR -le $NUMBR_OF_TESTS ]
do
	afl-plot "$TEST_DIR/test$TEST_NUMBR/out0/" "$TEST_DIR/test$TEST_NUMBR/out0"
	((TEST_NUMBR++))
done

}


#DEFAULT VALUES SO TESTING IS FASTER
FUZZER_DIR="/home/deploy/Documents/utils/fuzzers/ThesisWork/Instrumentation/afl-instr"
FUZZER_EXE="$FUZZER_DIR/afl-fuzz"

#libtex2
#(timeout "$TIME_PER_TEST"h $FUZZER_EXE -S test -z exp -i test$TEST_NUMBR/in -o test$TEST_NUMBR/out $PROG_RUN)


EXE="xmllint"
EXE_DIR="/home/deploy/Documents/utils/datasets/libxml2"
EXE_PATH="$EXE_DIR/$EXE"


EXE_OLD="xmllint"
EXE_DIR_OLD="/home/deploy/Documents/utils/datasets/libxml2_old/libxml2"
EXE_PATH_OLD="$EXE_DIR_OLD/$EXE_OLD"

PROG_RUN="$EXE_PATH --valid --recover @@"
PROG2_RUN="$EXE_PATH_OLD --valid --recover @@"

#path to the dir we want the tests to be in
OUTDIR="."

NUMBR_OF_TESTS=10
TIME_PER_TEST=1
TEST_NUMBR=1
TIME="$TIME_PER_TEST"h
TEST_DIR="$OUTDIR/test1h"
PROGS="-p $PROG_RUN"
COMMAND="$FUZZER_EXE -q 15 -i $TEST_DIR/test$TEST_NUMBR/in -o $TEST_DIR/test$TEST_NUMBR/out $PROGS"
#echo "Command = $COMMAND"

run_prog

NUMBR_OF_TESTS=10
TIME_PER_TEST=1
TEST_NUMBR=1
TIME="$TIME_PER_TEST"h
TEST_DIR="$OUTDIR/double_test1h"
PROGS="-p $PROG_RUN -p $PROG2_RUN"
COMMAND="$FUZZER_EXE -q 15 -i $TEST_DIR/test$TEST_NUMBR/in -o $TEST_DIR/test$TEST_NUMBR/out $PROGS"

run_prog

NUMBR_OF_TESTS=10
TIME_PER_TEST=4
TEST_NUMBR=1
TIME="$TIME_PER_TEST"h
TEST_DIR="$OUTDIR/test4h"
PROGS="-p $PROG_RUN"
COMMAND="$FUZZER_EXE -q 15 -i $TEST_DIR/test$TEST_NUMBR/in -o $TEST_DIR/test$TEST_NUMBR/out $PROGS"
#echo "Command = $COMMAND"

run_prog

NUMBR_OF_TESTS=10
TIME_PER_TEST=4
TEST_NUMBR=1
TIME="$TIME_PER_TEST"h
TEST_DIR="$OUTDIR/double_test4h"
PROGS="-p $PROG_RUN -p $PROG2_RUN"
COMMAND="$FUZZER_EXE -q 15 -i $TEST_DIR/test$TEST_NUMBR/in -o $TEST_DIR/test$TEST_NUMBR/out $PROGS"

run_prog