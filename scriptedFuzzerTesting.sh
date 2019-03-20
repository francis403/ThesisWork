#!/bin/bash

#To run the script
#example: ./scriptedFuzzerTesting.sh ../datasets/libxml2/xmllint .


#Before running the scripts give full permission to it!
# chmod +x name_of_script.sh

if [ $# -lt 2 ]; then
  echo "Usage: $0 <path-to-executable> <output-directory>"
  echo ""
  exit 1
fi

#Hard coded the tests are faster
#When moving computers change thi
FUZZER=aflgo
FUZZER_DIR="/home/deploy/Documents/utils/fuzzers/$FUZZER"
FUZZER_EXE="$FUZZER_DIR/afl-fuzz"
EXE=$(readlink -e $1)
OUTDIR=$(readlink -e $2)

#Sanity checks
if [ -z "$FUZZER_DIR" ]; then echo "Couldn't fnd fuzzer dir ($FUZZER_DIR)."; exit 1; fi
if [ -z "$EXE" ]; then echo "Couldn't find executable in path ($1)."; exit 1; fi
if [ -z "$OUTDIR" ]; then echo "Couldn't find output dir ($2)."; exit 1; fi

#Times we are gonna test the fuzzer
NUMBR_OF_TESTS=10
#Time in hours to test each fuzzer
TIME_PER_TEST=1

TEST_NUMBR=1

#$FUZZER_EXE -S test -z exp -c 45 -i test$TEST_NUMBR/in -o test$TEST_NUMBR/out $EXE --valid --recover @@

#Right now we have to wait for each process to finish, would like to be able to run them in parallel

PROG_RUN="$EXE --valid --recover @@"

while [ $TEST_NUMBR -lt $NUMBR_OF_TESTS ]
do
	echo "Starting fuzzing process number $TEST_NUMBR"
	mkdir "test$TEST_NUMBR"
	mkdir "test$TEST_NUMBR/in"
	echo "" > "test$TEST_NUMBR/in/test"
	rm -rf "test$TEST_NUMBR/out"
	if [ $TEST_NUMBR -eq 1 ]; then
		(timeout "$TIME_PER_TEST"h $FUZZER_EXE -S test -z exp -i test$TEST_NUMBR/in -o test$TEST_NUMBR/out $PROG_RUN)&
	else
		(timeout "$TIME_PER_TEST"h $FUZZER_EXE -S test -z exp -i test$TEST_NUMBR/in -o test$TEST_NUMBR/out $PROG_RUN) &>/dev/null &
	fi
	((TEST_NUMBR++))
done

echo "Starting fuzzing process number $TEST_NUMBR"
mkdir "test$TEST_NUMBR"
mkdir "test$TEST_NUMBR/in"
echo "" > "test$TEST_NUMBR/in/test"
rm -rf "test$TEST_NUMBR/out"
(timeout "$TIME_PER_TEST"h $FUZZER_EXE -S test -z exp -i test$TEST_NUMBR/in -o test$TEST_NUMBR/out $PROG_RUN) &>/dev/null 

clear

#Generate all index.html
TEST_NUMBR=1
while [ $TEST_NUMBR -le $NUMBR_OF_TESTS ]
do
	$FUZZER_DIR/afl-plot "test$TEST_NUMBR/out/test" "test$TEST_NUMBR"
	((TEST_NUMBR++))
done

