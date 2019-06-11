Command line used to find this crash:

/home/deploy/Documents/utils/fuzzers/sol_var/sol_var/afl-instr//afl-fuzz -q 15 -i ./double_test8h_cxxfilt/test6/in -o ./double_test8h_cxxfilt/test6/out -p /home/deploy/Documents/utils/datasets/binutils/binutils-2.25-sol_var/binutils/cxxfilt -p /home/deploy/Documents/utils/datasets/binutils/binutils-2.26-sol_var/binutils/cxxfilt

If you can't reproduce a bug outside of afl-fuzz, be sure to set the same
memory limit. The limit used for this fuzzing session was 50.0 MB.

Need a tool to minimize test cases before investigating the crashes or sending
them to a vendor? Check out the afl-tmin that comes with the fuzzer!

Found any cool bugs in open-source tools using afl-fuzz? If yes, please drop
me a mail at <lcamtuf@coredump.cx> once the issues are fixed - I'd love to
add your finds to the gallery at:

  http://lcamtuf.coredump.cx/afl/

Thanks :-)
