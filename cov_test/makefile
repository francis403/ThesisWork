#This here is an example on how to use the gcov to generate the cov#

PROG=simple_program.c
EXEC=simple

FLAGS=-fprofile-arcs -ftest-coverage

PATH_TO_AFL_OUT=../Instrumentation/out

PATH_TO_EXEC=/home/francis/Documents/ThesisWork/Instrumentation/$(EXEC)

gen_cov: 
	gcc $(FLAGS) $(PROG) -o $(EXEC) -w


clean:
	rm $(EXEC)  simple_program.gcno

#WHEN WE READ TO A FILE (with --live we need to run this before we run the fuzzer)#
#works#
cov_file_live:
	afl-cov -d $(PATH_TO_AFL_OUT) --live --overwrite --coverage-cmd \
"cat AFL_FILE | /home/francis/Documents/ThesisWork/cov_test/simple" --code-dir .



cov_live: 
	afl-cov -d $(PATH_TO_AFL_OUT) --live --overwrite --coverage-cmd \
"~/Documents/cov_test/simple -f AFL_FILE" \
--code-dir .


#Covers after the fuzzing has been done#
cov_after:
	afl-cov -d $(PATH_TO_AFL_OUT) --coverage-cmd \
"LD_LIBRARY_PATH=./lib/.libs /home/francis/Documents/cov_test/simple -f AFL_FILE -a -b -c" \
--code-dir .

test:
	afl-cov -d $(PATH_TO_AFL_OUT) --live --coverage-cmd \
"cat AFL_FILE | LD_LIBRARY_PATH=./lib/.libs ./bin/.libs/somebin -a -b -c" \
--code-dir .
