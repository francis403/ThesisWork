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
	COMMAND="timeout '$TIME_PER_TEST'h $FUZZER_EXE -i $TEST_DIR/test$TEST_NUMBR/in -o $TEST_DIR/test$TEST_NUMBR/out $PROGS"
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
	afl-plot "$TEST_DIR/test$TEST_NUMBR/out" "$TEST_DIR/test$TEST_NUMBR/out"
	((TEST_NUMBR++))
done

}


#DEFAULT VALUES SO TESTING IS FASTER
FUZZER_DIR="/home/deploy/Documents/utils/fuzzers/afl-2.52b"
FUZZER_EXE="$FUZZER_DIR/afl-fuzz"

#libtex2
#(timeout "$TIME_PER_TEST"h $FUZZER_EXE -S test -z exp -i test$TEST_NUMBR/in -o test$TEST_NUMBR/out $PROG_RUN)


EXE="readpng"
EXE_DIR="/home/deploy/Documents/utils/datasets/libpng/libpng-16-afl/contrib/libtests"
EXE_PATH="$EXE_DIR/$EXE"
PROG_RUN="$EXE_PATH"



#path to the dir we want the tests to be in
OUTDIR="."

NUMBR_OF_TESTS=10
TIME_PER_TEST=1
TEST_NUMBR=1
TIME="$TIME_PER_TEST"h
TEST_DIR="$OUTDIR/test1h"
PROGS="$PROG_RUN"
COMMAND="timeout '$TIME_PER_TEST'h $FUZZER_EXE -i $TEST_DIR/test$TEST_NUMBR/in -o $TEST_DIR/test$TEST_NUMBR/out $PROGS"
run_prog


NUMBR_OF_TESTS=10
TIME_PER_TEST=4
TEST_NUMBR=1
TIME="$TIME_PER_TEST"h
TEST_DIR="$OUTDIR/test4h"
PROGS="$PROG_RUN"
COMMAND="timeout '$TIME_PER_TEST'h $FUZZER_EXE -i $TEST_DIR/test$TEST_NUMBR/in -o $TEST_DIR/test$TEST_NUMBR/out $PROGS"
run_prog


NUMBR_OF_TESTS=10
TIME_PER_TEST=8
TEST_NUMBR=1
TIME="$TIME_PER_TEST"h
TEST_DIR="$OUTDIR/test8h"
PROGS="$PROG_RUN"
COMMAND="timeout '$TIME_PER_TEST'h $FUZZER_EXE -i $TEST_DIR/test$TEST_NUMBR/in -o $TEST_DIR/test$TEST_NUMBR/out $PROGS"
run_prog


<<'END'
NUMBR_OF_TESTS=10
COUNTER=0
UP_TO=4
TIME_PER_TEST=1
while [ $COUNTER -lt $UP_TO ]
do
	TEST_NUMBR=1
	if [ $COUNTER -lt 2 ]; then
		TIME_PER_TEST=1
	elif [  $COUNTER -lt 4 ]; then
		TIME_PER_TEST=4
	else 
		TIME_PER_TEST=8
	fi
	TIME="$TIME_PER_TEST"h
	TEST_DIR="$OUTDIR/test$COUNTER"
done
END