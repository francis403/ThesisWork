/*
   american fuzzy lop - wrapper for GNU as
   ---------------------------------------

   Written and maintained by Michal Zalewski <lcamtuf@google.com>

   Copyright 2013, 2014, 2015 Google Inc. All rights reserved.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at:

     http://www.apache.org/licenses/LICENSE-2.0

   The sole purpose of this wrapper is to preprocess assembly files generated
   by GCC / clang and inject the instrumentation bits included from afl-as.h. It
   is automatically invoked by the toolchain when compiling programs using
   afl-gcc / afl-clang.

   Note that it's an explicit non-goal to instrument hand-written assembly,
   be it in separate .s files or in __asm__ blocks. The only aspiration this
   utility has right now is to be able to skip them gracefully and allow the
   compilation process to continue.

   That said, see experimental/clang_asm_normalize/ for a solution that may
   allow clang users to make things work even with hand-crafted assembly. Just
   note that there is no equivalent for GCC.

 */

#define AFL_MAIN

#include "config.h"
#include "types.h"
#include "debug.h"
#include "alloc-inl.h"

#include "instr-as.h"

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <ctype.h>
#include <fcntl.h>

#include <sys/wait.h>
#include <sys/time.h>

static u8** as_params;          /* Parameters passed to the real 'as'   */

static u8*  input_file;         /* Originally specified input file      */
static u8*  modified_file;      /* Instrumented file for the real 'as'  */

static u8   be_quiet,           /* Quiet mode (no stderr output)        */
            clang_mode,         /* Running in clang mode?               */
            pass_thru,          /* Just pass data through?              */
            just_version,       /* Just show version?                   */
            sanitizer;          /* Using ASAN / MSAN                    */

static u32  inst_ratio = 100,   /* Instrumentation probability (%)      */
            as_par_cnt = 1;     /* Number of params to 'as'             */

/* If we don't find --32 or --64 in the command line, default to 
   instrumentation for whichever mode we were compiled with. This is not
   perfect, but should do the trick for almost all use cases. */

#ifdef __x86_64__

static u8   use_64bit = 1;

#else

static u8   use_64bit = 0;

#ifdef __APPLE__
#  error "Sorry, 32-bit Apple platforms are not supported."
#endif /* __APPLE__ */

#endif /* ^__x86_64__ */

static char *test_directory = "/home/francis/Documents/ThesisWork/";

/* Examine and modify parameters to pass to 'as'. Note that the file name
   is always the last parameter passed by GCC, so we exploit this property
   to keep the code simple. */

static void edit_params(int argc, char** argv) {

  u8 *tmp_dir = getenv("TMPDIR"), *afl_as = getenv("AFL_AS");
  u32 i;

#ifdef __APPLE__

  u8 use_clang_as = 0;

  /* On MacOS X, the Xcode cctool 'as' driver is a bit stale and does not work
     with the code generated by newer versions of clang that are hand-built
     by the user. See the thread here: http://goo.gl/HBWDtn.

     To work around this, when using clang and running without AFL_AS
     specified, we will actually call 'clang -c' instead of 'as -q' to
     compile the assembly file.

     The tools aren't cmdline-compatible, but at least for now, we can
     seemingly get away with this by making only very minor tweaks. Thanks
     to Nico Weber for the idea. */

  if (clang_mode && !afl_as) {

    use_clang_as = 1;

    afl_as = getenv("AFL_CC");
    if (!afl_as) afl_as = getenv("AFL_CXX");
    if (!afl_as) afl_as = "clang";

  }

#endif /* __APPLE__ */

  /* Although this is not documented, GCC also uses TEMP and TMP when TMPDIR
     is not set. We need to check these non-standard variables to properly
     handle the pass_thru logic later on. */

  if (!tmp_dir) tmp_dir = getenv("TEMP");
  if (!tmp_dir) tmp_dir = getenv("TMP");
  if (!tmp_dir) tmp_dir = "/tmp";

  as_params = ck_alloc((argc + 32) * sizeof(u8*));

  as_params[0] = afl_as ? afl_as : (u8*)"as";

  as_params[argc] = 0;

  for (i = 1; i < argc - 1; i++) {

    if (!strcmp(argv[i], "--64")) use_64bit = 1;
    else if (!strcmp(argv[i], "--32")) use_64bit = 0;

#ifdef __APPLE__

    /* The Apple case is a bit different... */

    if (!strcmp(argv[i], "-arch") && i + 1 < argc) {

      if (!strcmp(argv[i + 1], "x86_64")) use_64bit = 1;
      else if (!strcmp(argv[i + 1], "i386"))
        FATAL("Sorry, 32-bit Apple platforms are not supported.");

    }

    /* Strip options that set the preference for a particular upstream
       assembler in Xcode. */

    if (clang_mode && (!strcmp(argv[i], "-q") || !strcmp(argv[i], "-Q")))
      continue;

#endif /* __APPLE__ */

    as_params[as_par_cnt++] = argv[i];

  }

#ifdef __APPLE__

  /* When calling clang as the upstream assembler, append -c -x assembler
     and hope for the best. */

  if (use_clang_as) {

    as_params[as_par_cnt++] = "-c";
    as_params[as_par_cnt++] = "-x";
    as_params[as_par_cnt++] = "assembler";

  }

#endif /* __APPLE__ */

  input_file = argv[argc - 1];

  if (input_file[0] == '-') {

    if (!strcmp(input_file + 1, "-version")) {
      just_version = 1;
      modified_file = input_file;
      goto wrap_things_up;
    }

    if (input_file[1]) FATAL("Incorrect use (not called through afl-gcc?)");
      else input_file = NULL;

  } else {

    /* Check if this looks like a standard invocation as a part of an attempt
       to compile a program, rather than using gcc on an ad-hoc .s file in
       a format we may not understand. This works around an issue compiling
       NSS. */

    if (strncmp(input_file, test_directory, strlen(tmp_dir)) &&
        strncmp(input_file, "/var/tmp/", 9) &&
        strncmp(input_file, "/tmp/", 5)) pass_thru = 1;

  }

  modified_file = alloc_printf("%s/.afl-%u-%u.s", test_directory, getpid(),
                               (u32)time(NULL));

wrap_things_up:

  as_params[as_par_cnt++] = modified_file;
  as_params[as_par_cnt]   = NULL;

}

/**
* Added by FA
* Concats two strings
**/
char *concat( char *s1, char *s2)
{
  char *result = malloc(strlen(s1) + strlen(s2) + 1);
  strcpy(result, s1);
  strcat(result, s2);
  return result;
}

// adds the line to the destiny
void concatInto( char **dest, char *line ){
  char *temp = concat(*dest, line);
  //printf("%s\n", temp);
  *dest = realloc(*dest, strlen(temp) * sizeof(char) + 1); //add the line to the lines
  strcpy(*dest, temp);
  free(temp);
}

int hash_string(char *input){
  int hash = 0;
  int g = 3;
  //printf("gonna hash = %s\n", input);
  for( int i = 0; i < strlen(input); i++ ){
    hash += (i +1) * (input[i] - 1);
  }

  return hash == 0 ? 1 : hash;
}

/**
* Quick hash just to see if it works
* Returns a positive number
* O(2n) -> consigo melhorar para O(n)
* We take into consideration:
*   - The number of actually important lines
*   - 
**/
unsigned int blockIDGenerator(char *block){

  unsigned int result = 1;
   
  char *string_to_hash = calloc(0, sizeof(char)); //string to eventually hash
  char *copy = malloc ( sizeof(char) * strlen(block) + 1 );
  strcpy(copy, block);

  int num_of_lines = 0;
  char *delim = "\n";
  
  //printf("\n---BLOCK---\n\n");
  //printf("%s\n", block );
  //printf("\n---END OF BLOCK---\n\n");

  char *line = strtok(copy, delim);

  while(line != NULL){
    //printf("line = %s\n", line);
    
    // there are some line we want to skip
    if ( line[0] == '.'){
      //printf("skipped = %s\n", line);
      line = strtok(NULL, delim);
      continue;
    }
    
    char *rest = line;
    char *command;
    int  add_next_line = -1;
    
    while((command = strtok_r(rest, "\t", &rest))){
      if(command[0] == '.' || command[1] == '.' ||command[0] == '%' || command[0] == '$' ) { continue; }


      //SPECIAL CASES
      if( strcmp(command, "call") ){
        add_next_line = 1; 
        concatInto(&string_to_hash, command);
        continue;
      }
      else if( command[0] == '$' && command[1] != '.' ){
        //another special case
    
        //concatInfo(&string_to_hash, var);
        continue;
      }
      //printf("%s\n", command);
      concatInto(&string_to_hash, command);
    }
    free(command);    
    //concatInto(string_to_hash, line[0]);
    

    //char *val = getStringToHashFromBlockLine(line);
    //concatInto(&string_to_hash, getStringToHashFromBlockLine(line));
    line = strtok(NULL, delim);
  }

  //printf("\n RESULT = %s\n", string_to_hash);
  int val = hash_string(string_to_hash) % MAP_SIZE;
  //printf("result = %d\n", val);
  free(line);
  free(copy);
  free(string_to_hash);
  return val% MAP_SIZE;
}

// clean the isntrumented pointer
void clearInstr( char **instr ){
  free(*instr);
  *instr = calloc(0, sizeof(char));
}

void copy(FILE *source, FILE *target){
  char ch;
  while ( (ch = fgetc(source)) != EOF )
    fputc(ch, target);
}

void addToOutFile(FILE *file, char *lines){
  // get the id to add to the block
  int block_id = blockIDGenerator(lines);
  //int block_id = R(MAP_SIZE);
  fprintf(file, use_64bit ? trampoline_fmt_64 : trampoline_fmt_32,
              block_id); //TODO: -> shows the added lines
  //printf("LINE ---\n %s\n", lines);
  //fputs("#----- FA - BEGINNING OF CODE to be hashed-----#\n", file);
  fputs(lines, file);
  //fputs("#----- END OF CODE TO BE HASHED ------#\n", file);
}

/* Process input file, generate modified_file. Insert instrumentation in all
   the appropriate places. */

static void add_instrumentation(void) {

  SAYF("\n\t-----add_instrumentation instr-as -------\n");

  //added by Francisco Araujo: keeps the lines to be instrumented
  FILE *instr_lines, *instr_lines_after;
  char *fname =  "/home/francis/Documents/ThesisWork/instr_lines.txt";
  char *fname_after =  "/home/francis/Documents/ThesisWork/instr_lines_after.txt";
  //instr_lines = fopen("/home/francis/Documents/ThesisWork/instr_lines.txt","wb+");

  
  if( access(fname, F_OK) != -1  ){
    // if files arleady exist remove them
    remove(fname); remove(fname_after);
  }

 
  instr_lines = fopen(fname,"wb+");
  instr_lines_after = fopen(fname_after,"wb+");
  


  static u8 line[MAX_LINE];

  //TODO -> ver o que estes ficheiros fazem e como o AFL usa-os
  FILE* inf;
  FILE* outf;
  s32 outfd;
  u32 ins_lines = 0;

  u8  instr_ok = 0, skip_csect = 0, skip_next_label = 0,
      skip_intel = 0, skip_app = 0, instrument_next = 0;

#ifdef __APPLE__

  u8* colon_pos;

#endif /* __APPLE__ */

  if (input_file) {

    printf("input_file = %s\n",input_file);
    inf = fopen(input_file, "r"); //change to read eventually
    if (!inf) PFATAL("Unable to read '%s'", input_file);

  } else inf = stdin;

  outfd = open(modified_file, O_WRONLY | O_EXCL | O_CREAT, 0600);

  if (outfd < 0) PFATAL("Unable to write to '%s'", modified_file);

  outf = fdopen(outfd, "w"); // opens the file
  printf("modified_file = %s\n", modified_file);
  //printf("inf = %s\n", inf);
  if (!outf) PFATAL("fdopen() failed");  

  int num_of_lines_recorded = 0; //number of lines to be instrumented
  int is_recording = 0; // are we recording the lines to be added?
  

  char *lines_to_instrument = calloc(0, sizeof(char));
  
  // TODO -> need to slightly change this loop to add the ability to add personalized ids
  while (fgets(line, MAX_LINE, inf)) { //pass through all the assembly line of code

    //SAYF("line = %s", line);
    fputs(line, instr_lines); //adds the line so we can see how the file was originally

    /* In some cases, we want to defer writing the instrumentation trampoline
       until after all the labels, macros, comments, etc. If we're in this
       mode, and if the line starts with a tab followed by a character, dump
       the trampoline now. */

    //ADDS THE TRAMPOLINE CODE
    if (!pass_thru && !skip_intel && !skip_app && !skip_csect && instr_ok &&
        instrument_next && line[0] == '\t' && isalpha(line[1])) {

      // if we found the new beggining of the next line to be instrumented and we're instrumenting the last one still, end it
      if(is_recording){

        is_recording = 0;
        num_of_lines_recorded = 0; //no block no lines

        //add all the lines to the output file
        addToOutFile(instr_lines_after, lines_to_instrument);

        // clean the value inside it
        clearInstr(&lines_to_instrument);

      }
	
      fprintf(outf, use_64bit ? trampoline_fmt_64 : trampoline_fmt_32,
              R(MAP_SIZE)); //ideia -> é aqui que estão a adicionar o id aleatorio!!!! e guarda no $0x%08x

      // put it in the section above
      
      /*
      fprintf(instr_lines_after, use_64bit ? trampoline_fmt_64 : trampoline_fmt_32,
              R(MAP_SIZE)); //TODO: -> shows the added lines

      fputs("#----- FA - BEGINNING OF CODE to be hashed-----#\n", instr_lines_after);
      */

      is_recording = 1;

      instrument_next = 0;
      ins_lines++;

    }
    //if(strstr(line, "\taddl\t$4, %eax"))  printf("%s\n", line);
    /* Output the actual line, call it a day in pass-thru mode. */
    //added only to be able to show we can actually change the program
    char *newLine = NULL;
    char *change = NULL;
    //if( strstr(line, "\taddl\t$4, %eax") ){
    //  change = "\taddl\t$100, %eax\n";
    //} 
    if(strstr(line, "\t.string\t\"This always happens\"\n")){
      change = "\t.string \"This, amazingly, always happens\"\n";
      //char *change = line;
    } 
    /*else if(strstr(line, "\tmovl\t$4, %edx")){
      change = "\tmovl\t$100, %edx\n";
    }*/
    /* 
    else if(strstr(line, "\tmovl\t$15, %eax")){
      //movl  $15, %eax
      //printf("found\n" );
      change = "\tmovl\t$100, %eax\n";
    }
    */
    else if(strstr(line, "\tmovl\t$15, %edx")){
      //movl  $15, %eax
      //printf("found\n" );
     change = "\tmovl\t$451, %edx\n";
    } 
    else if( strstr(line, "\taddl\t$4, %ecx") ){
      change = "\taddl\t$100, %ecx\n";
    }
    //addl  $4, %ecx
    else{
      fputs(line, outf);
    }

    if(change != NULL){
      newLine = malloc( sizeof(char) * strlen(change) + 1);
      strcpy(newLine, change);
      fputs(change, outf);
    }

    if(newLine == NULL){
      newLine = malloc(sizeof(char) * strlen(line) + 1);
      strcpy(newLine, line);
    }


    /*---END OF ADDED FOR PRESENTATION*/

    if(is_recording){
      concatInto(&lines_to_instrument, newLine);
      num_of_lines_recorded ++;
    }
    else { 
      fputs(newLine, instr_lines_after);
    } 

    //fputs(line, instr_lines_after); // shows what happens after
    
    if (strstr(line, ".cfi_endproc")){
         if(is_recording){
            is_recording = 0;

            //add all the lines out
            addToOutFile(instr_lines_after, lines_to_instrument);
            //printf("lines = %s\n", lines_to_instrument);

            // clear the line
            clearInstr(&lines_to_instrument);

            num_of_lines_recorded = 0; //no block no lines
        }
    }

    //if (pass_thru) continue;

    /* All right, this is where the actual fun begins. For one, we only want to
       instrument the .text section. So, let's keep track of that in processed
       files - and let's set instr_ok accordingly. */

    if (line[0] == '\t' && line[1] == '.') {

      /* OpenBSD puts jump tables directly inline with the code, which is
         a bit annoying. They use a specific format of p2align directives
         around them, so we use that as a signal. */

      if (!clang_mode && instr_ok && !strncmp(line + 2, "p2align ", 8) &&
          isdigit(line[10]) && line[11] == '\n') skip_next_label = 1;

      if (!strncmp(line + 2, "text\n", 5) ||
          !strncmp(line + 2, "section\t.text", 13) ||
          !strncmp(line + 2, "section\t__TEXT,__text", 21) ||
          !strncmp(line + 2, "section __TEXT,__text", 21)) {
        instr_ok = 1;
        continue; 
      }

      if (!strncmp(line + 2, "section\t", 8) ||
          !strncmp(line + 2, "section ", 8) ||
          !strncmp(line + 2, "bss\n", 4) ||
          !strncmp(line + 2, "data\n", 5)) {
        instr_ok = 0;
        continue;
      }

    }

    //SAYF("line = %s", line);

    /* Detect off-flavor assembly (rare, happens in gdb). When this is
       encountered, we set skip_csect until the opposite directive is
       seen, and we do not instrument. */

    if (strstr(line, ".code")) {

      if (strstr(line, ".code32")) skip_csect = use_64bit;
      if (strstr(line, ".code64")) skip_csect = !use_64bit;

    }

    /* Detect syntax changes, as could happen with hand-written assembly.
       Skip Intel blocks, resume instrumentation when back to AT&T. */

    if (strstr(line, ".intel_syntax")) skip_intel = 1;
    if (strstr(line, ".att_syntax")) skip_intel = 0;

    /* Detect and skip ad-hoc __asm__ blocks, likewise skipping them. */

    if (line[0] == '#' || line[1] == '#') {

      if (strstr(line, "#APP")) skip_app = 1;
      if (strstr(line, "#NO_APP")) skip_app = 0;

    }
    //todo -> check

    /* If we're in the right mood for instrumenting, check for function
       names or conditional labels. This is a bit messy, but in essence,
       we want to catch:

         ^main:      - function entry point (always instrumented)
         ^.L0:       - GCC branch label
         ^.LBB0_0:   - clang branch label (but only in clang mode)
         ^\tjnz foo  - conditional branches

       ...but not:

         ^# BB#0:    - clang comments
         ^ # BB#0:   - ditto
         ^.Ltmp0:    - clang non-branch labels
         ^.LC0       - GCC non-branch labels
         ^.LBB0_0:   - ditto (when in GCC mode)
         ^\tjmp foo  - non-conditional jumps

       Additionally, clang and GCC on MacOS X follow a different convention
       with no leading dots on labels, hence the weird maze of #ifdefs
       later on.

     */

    if (skip_intel || skip_app || skip_csect || !instr_ok ||
        line[0] == '#' || line[0] == ' ') continue;

    /* Conditional branch instruction (jnz, etc). We append the instrumentation
       right after the branch (to instrument the not-taken path) and at the
       branch destination label (handled later on). */

    if (line[0] == '\t') {

      if (line[1] == 'j' && line[2] != 'm' && R(100) < inst_ratio) {
        
        if(is_recording){
          is_recording = 0;
          num_of_lines_recorded = 0; //no block no lines

          //TODO: add all the lines
          addToOutFile(instr_lines_after, lines_to_instrument);
          
          // clean the lines buffer
          clearInstr(&lines_to_instrument);
        }
		
        fprintf(outf, use_64bit ? trampoline_fmt_64 : trampoline_fmt_32,
                R(MAP_SIZE));

        /*
        fprintf(instr_lines_after, use_64bit ? trampoline_fmt_64 : trampoline_fmt_32,
                R(MAP_SIZE));
        fputs("#----- FA - BEGINNING OF CODE to be hashed-----#\n", instr_lines_after);
        */
        ins_lines++;

        num_of_lines_recorded ++;
        is_recording = 1;

      }
      continue;
    }


    /* Label of some sort. This may be a branch destination, but we need to
       tread carefully and account for several different formatting
       conventions. */

#ifdef __APPLE__

    /* Apple: L<whatever><digit>: */

    if ((colon_pos = strstr(line, ":"))) {

      if (line[0] == 'L' && isdigit(*(colon_pos - 1))) {

#else

    /* Everybody else: .L<whatever>: */

    if (strstr(line, ":")) {

      if (line[0] == '.') {

#endif /* __APPLE__ */

        /* .L0: or LBB0_0: style jump destination */

#ifdef __APPLE__

        /* Apple: L<num> / LBB<num> */

        if ((isdigit(line[1]) || (clang_mode && !strncmp(line, "LBB", 3)))
            && R(100) < inst_ratio) {

#else

        /* Apple: .L<num> / .LBB<num> */

        if ((isdigit(line[2]) || (clang_mode && !strncmp(line + 1, "LBB", 3)))
            && R(100) < inst_ratio) {

#endif /* __APPLE__ */

          /* An optimization is possible here by adding the code only if the
             label is mentioned in the code in contexts other than call / jmp.
             That said, this complicates the code by requiring two-pass
             processing (messy with stdin), and results in a speed gain
             typically under 10%, because compilers are generally pretty good
             about not generating spurious intra-function jumps.

             We use deferred output chiefly to avoid disrupting
             .Lfunc_begin0-style exception handling calculations (a problem on
             MacOS X). */

          if (!skip_next_label) instrument_next = 1; else skip_next_label = 0;

        }

      } else {

        /* Function label (always instrumented, deferred mode). */

        instrument_next = 1;
    
      }

    }

  } //end of while
  //fputs("/*Teste do programa*/\n",inf);
  //free(lines_to_instrument);
  if (ins_lines){
    fputs(use_64bit ? main_payload_64 : main_payload_32, outf);
    fputs((use_64bit ? main_payload_64 : main_payload_32), instr_lines_after);
  }

  //rewind(inf);
  FILE *original_changed = fopen(input_file, "wb+");
  FILE *read_modified = fopen(fname_after, "r");
  if(original_changed == NULL){
    printf("Null file in original\n");
  }
  if (read_modified == NULL) {
    printf("Null file in the read modified\n");
  }
  /*
  while(fgets(line, MAX_LINE, read_modified)){
    fputs(line, original_changed);
  }
  */
  copy(read_modified, original_changed);
  fclose(read_modified);
  fclose(original_changed);

  free(lines_to_instrument);

  fclose(instr_lines);
  fclose(instr_lines_after); //end of added by Francisco Araujo

  if (input_file) fclose(inf);
  fclose(outf);

  if (!be_quiet) {

    if (!ins_lines) WARNF("No instrumentation targets found%s.",
                          pass_thru ? " (pass-thru mode)" : "");
    else OKF("Instrumented %u locations (%s-bit, %s mode, ratio %u%%).",
             ins_lines, use_64bit ? "64" : "32",
             getenv("AFL_HARDEN") ? "hardened" : 
             (sanitizer ? "ASAN/MSAN" : "non-hardened"),
             inst_ratio);
 
  }

}


/* Main entry point */

int main(int argc, char** argv) {

  SAYF("\n\t-----Entry point to main point of instr-as.c-------\n");

  s32 pid;
  u32 rand_seed;
  int status;
  u8* inst_ratio_str = getenv("AFL_INST_RATIO");

  struct timeval tv;
  struct timezone tz;

  clang_mode = !!getenv(CLANG_ENV_VAR);

  if (isatty(2) && !getenv("AFL_QUIET")) {

    SAYF(cCYA "afl-as " cBRI VERSION cRST " by <lcamtuf@google.com>\n");
 
  } else be_quiet = 1;

  if (argc < 2) {

    SAYF("\n"
         "This is a helper application for afl-fuzz. It is a wrapper around GNU 'as',\n"
         "executed by the toolchain whenever using afl-gcc or afl-clang. You probably\n"
         "don't want to run this program directly.\n\n"

         "Rarely, when dealing with extremely complex projects, it may be advisable to\n"
         "set AFL_INST_RATIO to a value less than 100 in order to reduce the odds of\n"
         "instrumenting every discovered branch.\n\n");

    exit(1);

  }

  gettimeofday(&tv, &tz);

  rand_seed = tv.tv_sec ^ tv.tv_usec ^ getpid();

  srandom(rand_seed); // sets the random seed to generate the ids later

  edit_params(argc, argv);

  if (inst_ratio_str) {

    if (sscanf(inst_ratio_str, "%u", &inst_ratio) != 1 || inst_ratio > 100) 
      FATAL("Bad value of AFL_INST_RATIO (must be between 0 and 100)");

  }

  if (getenv(AS_LOOP_ENV_VAR))
    FATAL("Endless loop when calling 'as' (remove '.' from your PATH)");

  setenv(AS_LOOP_ENV_VAR, "1", 1);

  /* When compiling with ASAN, we don't have a particularly elegant way to skip
     ASAN-specific branches. But we can probabilistically compensate for
     that... */

  if (getenv("AFL_USE_ASAN") || getenv("AFL_USE_MSAN")) {
    sanitizer = 1;
    inst_ratio /= 3;
  }

  if (!just_version) add_instrumentation();

  //printf("as_params[0] = %s\n", as_params[0]);

  if (!(pid = fork())) {

    execvp(as_params[0], (char**)as_params);
    FATAL("Oops, failed to execute '%s' - check your PATH", as_params[0]);

  }

  if (pid < 0) PFATAL("fork() failed");

  if (waitpid(pid, &status, 0) <= 0) PFATAL("waitpid() failed");

  if (!getenv("AFL_KEEP_ASSEMBLY")) unlink(modified_file);

  exit(WEXITSTATUS(status));

}

