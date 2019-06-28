Command line used to find this crash:

/home/deploy/Documents/utils/fuzzers/sol_var/sol_var/afl-instr//afl-fuzz -q 15 -n 1 -u /home/deploy/Documents/utils/fuzzers/ThesisWork/testing/test_cxxfilt/testDelta/double_test1h_cxxfilt_test/test5/out1/ -i ./test8h_cxxfilt_ver2/test1/in -o ./test8h_cxxfilt_ver2/test1/out -p /home/deploy/Documents/utils/datasets/binutils/binutils-2.26-sol_var/binutils/cxxfilt

If you can't reproduce a bug outside of afl-fuzz, be sure to set the same
memory limit. The limit used for this fuzzing session was 50.0 MB.

Need a tool to minimize test cases before investigating the crashes or sending
them to a vendor? Check out the afl-tmin that comes with the fuzzer!

Found any cool bugs in open-source tools using afl-fuzz? If yes, please drop
me a mail at <lcamtuf@coredump.cx> once the issues are fixed - I'd love to
add your finds to the gallery at:

  http://lcamtuf.coredump.cx/afl/

Thanks :-)
