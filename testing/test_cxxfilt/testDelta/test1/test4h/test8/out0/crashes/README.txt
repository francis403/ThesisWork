Command line used to find this crash:

/home/deploy/Documents/utils/fuzzers/ThesisWork/Instrumentation/afl-instr/afl-fuzz -i ./test4h/test8/in -o ./test4h/test8/out -p /home/deploy/Documents/utils/datasets/binutils/binutils-2.25-delta1/binutils/cxxfilt

If you can't reproduce a bug outside of afl-fuzz, be sure to set the same
memory limit. The limit used for this fuzzing session was 50.0 MB.

Need a tool to minimize test cases before investigating the crashes or sending
them to a vendor? Check out the afl-tmin that comes with the fuzzer!

Found any cool bugs in open-source tools using afl-fuzz? If yes, please drop
me a mail at <lcamtuf@coredump.cx> once the issues are fixed - I'd love to
add your finds to the gallery at:

  http://lcamtuf.coredump.cx/afl/

Thanks :-)
