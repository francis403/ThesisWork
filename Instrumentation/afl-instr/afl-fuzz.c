/*
   american fuzzy lop - fuzzer code
   --------------------------------

   Written and maintained by Michal Zalewski <lcamtuf@google.com>

   Forkserver design by Jann Horn <jannhorn@googlemail.com>

   Copyright 2013, 2014, 2015, 2016, 2017 Google Inc. All rights reserved.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at:

     http://www.apache.org/licenses/LICENSE-2.0

   This is the real deal: the program takes an instrumented binary and
   attempts a variety of basic fuzzing tricks, paying close attention to
   how they affect the execution path.

 */

#define AFL_MAIN
#define MESSAGES_TO_STDOUT

#define _GNU_SOURCE
#define _FILE_OFFSET_BITS 64

#include "config.h"
#include "types.h"
#include "debug.h"
#include "alloc-inl.h"
#include "hash.h"

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <errno.h>
#include <signal.h>
#include <dirent.h>
#include <ctype.h>
#include <fcntl.h>
#include <termios.h>
#include <dlfcn.h>
#include <sched.h>

#include <sys/wait.h>
#include <sys/time.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/resource.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <sys/file.h>

//added by me
#include <poll.h>

#if defined(__APPLE__) || defined(__FreeBSD__) || defined (__OpenBSD__)
#  include <sys/sysctl.h>
#endif /* __APPLE__ || __FreeBSD__ || __OpenBSD__ */

/* For systems that have sched_setaffinity; right now just Linux, but one
   can hope... */

#ifdef __linux__
#  define HAVE_AFFINITY 1
#endif /* __linux__ */

/* A toggle to export some variables when building as a library. Not very
   useful for the general public. */

#ifdef AFL_LIB
#  define EXP_ST
#else
#  define EXP_ST static
#endif /* ^AFL_LIB */

/* Lots of globals, but mostly for the status UI and other things where it
   really makes no sense to haul them around as function parameters. */


EXP_ST u8 *in_dir,                    /* Input directory with test cases  */
          *out_file,                  /* File to fuzz, if any             */
          *out_dir,                   /* Working & output directory       */
          *sync_dir,                  /* Synchronization directory        */
          *sync_id,                   /* Fuzzer ID                        */
          *use_banner,                /* Display banner                   */
          *in_bitmap,                 /* Input bitmap                     */
          *doc_path,                  /* Path to documentation dir        */
		  *target_path[MAX_AMOUT_OF_PROGRAMS],
          //*target_path[MAX_AMOUT_OF_PROGRAMS],               /* Path to target binary            */
		  //*target_path,
          *orig_cmdline;              /* Original command line            */

EXP_ST u32 exec_tmout = EXEC_TIMEOUT; /* Configurable exec timeout (ms)   */
static u32 hang_tmout = EXEC_TIMEOUT; /* Timeout used for hang det (ms)   */

EXP_ST u64 mem_limit  = MEM_LIMIT;    /* Memory cap for child (MB)        */

static u32 stats_update_freq = 1;     /* Stats update frequency (execs)   */

EXP_ST u8  skip_deterministic,        /* Skip deterministic stages?       */
		   force_deterministic,       /* Force deterministic stages?      */
           dumb_mode,                 /* Run in non-instrumented mode?    */
		   use_splicing,              /* Recombine input files?           */
           score_changed,             /* Scoring for favorites changed?   */
           kill_signal,               /* Signal that killed the child     */
           resuming_fuzz,             /* Resuming an older fuzzing job?   */
           timeout_given,             /* Specific timeout given?          */
           not_on_tty,                /* stdout is not a tty              */
           term_too_small,            /* terminal dimensions too small    */
           uses_asan,                 /* Target uses ASAN?                */
           no_forkserver,             /* Disable forkserver?              */
           crash_mode,                /* Crash mode! Yeah!                */
           in_place_resume,           /* Attempt in-place resume?         */
           auto_changed,              /* Auto-generated tokens changed?   */
           no_cpu_meter_red,          /* Feng shui on the status screen   */
           shuffle_queue,             /* Shuffle input queue?             */
           bitmap_changed = 1,        /* Time to update bitmap?           */
           qemu_mode,                 /* Running in QEMU mode?            */
           skip_requested,            /* Skip request, via SIGUSR1        */
           run_over10m,               /* Run time over 10 minutes?        */
           persistent_mode,           /* Running in persistent mode?      */
           deferred_mode,             /* Deferred forkserver mode?        */
           fast_cal;                  /* Try to calibrate faster?         */

static s32 out_fd,                    /* Persistent fd for out_file       */
           dev_urandom_fd = -1,       /* Persistent fd for /dev/urandom   */
           dev_null_fd = -1,          /* Persistent fd for /dev/null      */
           fsrv_ctl_fd[MAX_AMOUT_OF_PROGRAMS],               /* Fork server control pipe (write) */
           fsrv_st_fd[MAX_AMOUT_OF_PROGRAMS];				  /* Fork server status pipe (read)   */ 

static s32 forksrv_pid[MAX_AMOUT_OF_PROGRAMS],               /* PID of the fork server           */
           child_pid = -1,            /* PID of the fuzzed program, maybe I'll need more than one        */
           out_dir_fd = -1;           /* FD of the lock file              */

pid_t block_pid;

/* TODO probably will need an array of this things */
EXP_ST u8* trace_bits;                /* SHM with instrumentation bitmap  */
EXP_ST u8* trace_bits_todo[MAX_AMOUT_OF_PROGRAMS]; /* SGM with instrumentation bitmap array */ //Todo -> tenho medo de ser demasiado espaco 


EXP_ST u8  virgin_bits[MAP_SIZE],     /* Regions yet untouched by fuzzing */
           virgin_tmout[MAP_SIZE],    /* Bits we haven't seen in tmouts   */
           virgin_crash[MAP_SIZE];    /* Bits we haven't seen in crashes  */

static u8  var_bytes[MAP_SIZE];       /* Bytes that appear to be variable */

//TODO -> probably need an array here as well
static s32 shm_id;                    /* ID of the SHM region             */
static s32 shm_id_todo[MAX_AMOUT_OF_PROGRAMS];			  /* Array of IDs of shared memory of all programs */

static volatile u8 stop_soon,         /* Ctrl-C pressed?                  */
                   clear_screen = 1,  /* Window resized?                  */
                   child_timed_out;   /* Traced process timed out?        */

EXP_ST u32 queued_paths,              /* Total number of queued testcases */
           queued_variable,           /* Testcases with variable behavior */
           queued_at_start,           /* Total number of initial inputs   */
           queued_discovered,         /* Items discovered during this run */
           queued_imported,           /* Items imported via -S            */
           queued_favored,            /* Paths deemed favorable           */
           queued_with_cov,           /* Paths with new coverage bytes    */
           pending_not_fuzzed,        /* Queued but not done yet          */
           pending_favored,           /* Pending favored paths            */
           cur_skipped_paths,         /* Abandoned inputs in cur cycle    */
           cur_depth,                 /* Current path depth               */
           max_depth,                 /* Max path depth                   */
           useless_at_start,          /* Number of useless starting paths */
           var_byte_count,            /* Bitmap bytes with var behavior   */
           current_entry,             /* Current queue entry ID           */
           havoc_div = 1;             /* Cycle count divisor for havoc    */

EXP_ST u64 total_crashes,             /* Total number of crashes          */
           unique_crashes,            /* Crashes with unique signatures   */
           total_tmouts,              /* Total number of timeouts         */
           unique_tmouts,             /* Timeouts with unique signatures  */
           unique_hangs,              /* Hangs with unique signatures     */
           total_execs,               /* Total execve() calls             */
           start_time,                /* Unix start time (ms)             */
           last_path_time,            /* Time for most recent path (ms)   */
           last_crash_time,           /* Time for most recent crash (ms)  */
           last_hang_time,            /* Time for most recent hang (ms)   */
           last_crash_execs,          /* Exec counter at last crash       */
           queue_cycle,               /* Queue round counter              */
           cycles_wo_finds,           /* Cycles without any new paths     */
           trim_execs,                /* Execs done to trim input files   */
           bytes_trim_in,             /* Bytes coming into the trimmer    */
           bytes_trim_out,            /* Bytes coming outa the trimmer    */
           blocks_eff_total,          /* Blocks subject to effector maps  */
           blocks_eff_select;         /* Blocks selected as fuzzable      */

static u8 *stage_name = "init";       /* Name of the current fuzz stage   */

static s32 stage_cur, stage_max;      /* Stage progression                */

static u64 stage_finds[32],           /* Patterns found per fuzz stage    */
           stage_cycles[32];          /* Execs per fuzz stage             */

static u32 rand_cnt;                  /* Random number counter            */

static u64 total_cal_us,              /* Total calibration time (us)      */
           total_cal_cycles;          /* Total calibration cycles         */

static u64 total_bitmap_size,         /* Total bit count for all bitmaps  */
           total_bitmap_entries;      /* Number of bitmaps counted        */

static s32 cpu_core_count;            /* CPU core count                   */

#ifdef HAVE_AFFINITY

static s32 cpu_aff = -1;       	      /* Selected CPU core                */

#endif /* HAVE_AFFINITY */

static FILE* plot_file;               /* Gnuplot output file              */

static int numbr_of_progs_under_test = 0;

struct queue_entry {

  u8* fname;                          /* File name for the test case      */
  u32 len;                            /* Input length                     */

  u8  cal_failed,                     /* Calibration failed?              */
      trim_done,                      /* Trimmed?                         */
      was_fuzzed,                     /* Had any fuzzing done yet?        */
      passed_det,                     /* Deterministic stages passed?     */
      has_new_cov,                    /* Triggers new coverage?           */
      var_behavior,                   /* Variable behavior?               */
      favored,                        /* Currently favored?               */
      fs_redundant;                   /* Marked as redundant in the fs?   */

  u32 bitmap_size,                    /* Number of bits set in bitmap     */
      exec_cksum;                     /* Checksum of the execution trace  */

  u64 exec_us,                        /* Execution time (us)              */
      handicap,                       /* Number of queue cycles behind    */
      depth;                          /* Path depth                       */

  u8* trace_mini;                     /* Trace bytes, if kept             */
  u32 tc_ref;                         /* Trace bytes ref count            */

  struct queue_entry *next,           /* Next element, if any             */
                     *next_100;       /* 100 elements ahead               */

};

static struct queue_entry *queue,     /* Fuzzing queue (linked list)      */
                          *queue_cur, /* Current offset within the queue  */
                          *queue_top, /* Top of the list                  */
                          *q_prev100; /* Previous 100 marker              */

static struct queue_entry*
  top_rated[MAP_SIZE];                /* Top entries for bitmap bytes     */

struct extra_data {
  u8* data;                           /* Dictionary token data            */
  u32 len;                            /* Dictionary token length          */
  u32 hit_cnt;                        /* Use count in the corpus          */
};

static struct extra_data* extras;     /* Extra tokens to fuzz with        */
static u32 extras_cnt;                /* Total number of tokens read      */

static struct extra_data* a_extras;   /* Automatically selected extras    */
static u32 a_extras_cnt;              /* Total number of tokens available */

static u8* (*post_handler)(u8* buf, u32* len);


/* Interesting values, as per config.h */

static s8  interesting_8[]  = { INTERESTING_8 };
static s16 interesting_16[] = { INTERESTING_8, INTERESTING_16 };
static s32 interesting_32[] = { INTERESTING_8, INTERESTING_16, INTERESTING_32 };


/* Fuzzing stages */

enum {
  /* 00 */ STAGE_FLIP1,
  /* 01 */ STAGE_FLIP2,
  /* 02 */ STAGE_FLIP4,
  /* 03 */ STAGE_FLIP8,
  /* 04 */ STAGE_FLIP16,
  /* 05 */ STAGE_FLIP32,
  /* 06 */ STAGE_ARITH8,
  /* 07 */ STAGE_ARITH16,
  /* 08 */ STAGE_ARITH32,
  /* 09 */ STAGE_INTEREST8,
  /* 10 */ STAGE_INTEREST16,
  /* 11 */ STAGE_INTEREST32,
  /* 12 */ STAGE_EXTRAS_UO,
  /* 13 */ STAGE_EXTRAS_UI,
  /* 14 */ STAGE_EXTRAS_AO,
  /* 15 */ STAGE_HAVOC,
  /* 16 */ STAGE_SPLICE
};

/* Stage value types */

enum {
  /* 00 */ STAGE_VAL_NONE,
  /* 01 */ STAGE_VAL_LE,
  /* 02 */ STAGE_VAL_BE
};

/* Execution status fault codes */

enum {
  /* 00 */ FAULT_NONE,
  /* 01 */ FAULT_TMOUT,
  /* 02 */ FAULT_CRASH,
  /* 03 */ FAULT_ERROR,
  /* 04 */ FAULT_NOINST,
  /* 05 */ FAULT_NOBITS
};


/* Get unix time in milliseconds */

static u64 get_cur_time(void) {

	struct timeval tv;
	struct timezone tz;

	gettimeofday(&tv, &tz);

	return (tv.tv_sec * 1000ULL) + (tv.tv_usec / 1000);

}


/* Get unix time in microseconds */

static u64 get_cur_time_us(void) {

	struct timeval tv;
	struct timezone tz;

	gettimeofday(&tv, &tz);

	return (tv.tv_sec * 1000000ULL) + tv.tv_usec;

}


/* Generate a random number (from 0 to limit - 1). This may
   have slight bias. */

static inline u32 UR(u32 limit) {

	if (unlikely(!rand_cnt--)) {

		u32 seed[2];

		ck_read(dev_urandom_fd, &seed, sizeof(seed), "/dev/urandom");

		srandom(seed[0]);
		rand_cnt = (RESEED_RNG / 2) + (seed[1] % RESEED_RNG);

	}

	return random() % limit;

}


/* Shuffle an array of pointers. Might be slightly biased. */

static void shuffle_ptrs(void** ptrs, u32 cnt) {

	u32 i;

	for (i = 0; i < cnt - 2; i++) {

		u32 j = i + UR(cnt - i);
		void *s = ptrs[i];
		ptrs[i] = ptrs[j];
		ptrs[j] = s;

	}

}

/* Describe integer. Uses 12 cyclic static buffers for return values. The value
   returned should be five characters or less for all the integers we reasonably
   expect to see. */

static u8* DI(u64 val) {

	static u8 tmp[12][16];
	static u8 cur;

	cur = (cur + 1) % 12;

#define CHK_FORMAT(_divisor, _limit_mult, _fmt, _cast) do { \
	if (val < (_divisor) * (_limit_mult)) { \
		sprintf(tmp[cur], _fmt, ((_cast)val) / (_divisor)); \
		return tmp[cur]; \
	} \
} while (0)

  /* 0-9999 */
CHK_FORMAT(1, 10000, "%llu", u64);

  /* 10.0k - 99.9k */
CHK_FORMAT(1000, 99.95, "%0.01fk", double);

  /* 100k - 999k */
CHK_FORMAT(1000, 1000, "%lluk", u64);

  /* 1.00M - 9.99M */
CHK_FORMAT(1000 * 1000, 9.995, "%0.02fM", double);

  /* 10.0M - 99.9M */
CHK_FORMAT(1000 * 1000, 99.95, "%0.01fM", double);

  /* 100M - 999M */
CHK_FORMAT(1000 * 1000, 1000, "%lluM", u64);

  /* 1.00G - 9.99G */
CHK_FORMAT(1000LL * 1000 * 1000, 9.995, "%0.02fG", double);

  /* 10.0G - 99.9G */
CHK_FORMAT(1000LL * 1000 * 1000, 99.95, "%0.01fG", double);

  /* 100G - 999G */
CHK_FORMAT(1000LL * 1000 * 1000, 1000, "%lluG", u64);

  /* 1.00T - 9.99G */
CHK_FORMAT(1000LL * 1000 * 1000 * 1000, 9.995, "%0.02fT", double);

  /* 10.0T - 99.9T */
CHK_FORMAT(1000LL * 1000 * 1000 * 1000, 99.95, "%0.01fT", double);

  /* 100T+ */
strcpy(tmp[cur], "infty");
return tmp[cur];

}


/* Describe float. Similar to the above, except with a single 
   static buffer. */

static u8* DF(double val) {

	static u8 tmp[16];

	if (val < 99.995) {
		sprintf(tmp, "%0.02f", val);
		return tmp;
	}

	if (val < 999.95) {
		sprintf(tmp, "%0.01f", val);
		return tmp;
	}

	return DI((u64)val);

}


/* Describe integer as memory size. */

static u8* DMS(u64 val) {

	static u8 tmp[12][16];
	static u8 cur;

	cur = (cur + 1) % 12;

  /* 0-9999 */
	CHK_FORMAT(1, 10000, "%llu B", u64);

  /* 10.0k - 99.9k */
	CHK_FORMAT(1024, 99.95, "%0.01f kB", double);

  /* 100k - 999k */
	CHK_FORMAT(1024, 1000, "%llu kB", u64);

  /* 1.00M - 9.99M */
	CHK_FORMAT(1024 * 1024, 9.995, "%0.02f MB", double);

  /* 10.0M - 99.9M */
	CHK_FORMAT(1024 * 1024, 99.95, "%0.01f MB", double);

  /* 100M - 999M */
	CHK_FORMAT(1024 * 1024, 1000, "%llu MB", u64);

  /* 1.00G - 9.99G */
	CHK_FORMAT(1024LL * 1024 * 1024, 9.995, "%0.02f GB", double);

  /* 10.0G - 99.9G */
	CHK_FORMAT(1024LL * 1024 * 1024, 99.95, "%0.01f GB", double);

  /* 100G - 999G */
	CHK_FORMAT(1024LL * 1024 * 1024, 1000, "%llu GB", u64);

  /* 1.00T - 9.99G */
	CHK_FORMAT(1024LL * 1024 * 1024 * 1024, 9.995, "%0.02f TB", double);

  /* 10.0T - 99.9T */
	CHK_FORMAT(1024LL * 1024 * 1024 * 1024, 99.95, "%0.01f TB", double);

#undef CHK_FORMAT

  /* 100T+ */
	strcpy(tmp[cur], "infty");
	return tmp[cur];

}


/* Describe time delta. Returns one static buffer, 34 chars of less. */

static u8* DTD(u64 cur_ms, u64 event_ms) {

	static u8 tmp[64];
	u64 delta;
	s32 t_d, t_h, t_m, t_s;

	if (!event_ms) return "none seen yet";

	delta = cur_ms - event_ms;

	t_d = delta / 1000 / 60 / 60 / 24;
	t_h = (delta / 1000 / 60 / 60) % 24;
	t_m = (delta / 1000 / 60) % 60;
	t_s = (delta / 1000) % 60;

	sprintf(tmp, "%s days, %u hrs, %u min, %u sec", DI(t_d), t_h, t_m, t_s);
	return tmp;

}


/* Mark deterministic checks as done for a particular queue entry. We use the
   .state file to avoid repeating deterministic fuzzing when resuming aborted
   scans. */

static void mark_as_det_done(struct queue_entry* q) {

	u8* fn = strrchr(q->fname, '/');
	s32 fd;

	fn = alloc_printf("%s/queue/.state/deterministic_done/%s", out_dir, fn + 1);

	fd = open(fn, O_WRONLY | O_CREAT | O_EXCL, 0600);
	if (fd < 0) PFATAL("Unable to create '%s'", fn);
	close(fd);

	ck_free(fn);

	q->passed_det = 1;

}

/* Mark as variable. Create symlinks if possible to make it easier to examine
   the files. */

static void mark_as_variable(struct queue_entry* q) {

  u8 *fn = strrchr(q->fname, '/') + 1, *ldest;

  ldest = alloc_printf("../../%s", fn);
  fn = alloc_printf("%s/queue/.state/variable_behavior/%s", out_dir, fn);

  if (symlink(ldest, fn)) {

    s32 fd = open(fn, O_WRONLY | O_CREAT | O_EXCL, 0600);
    if (fd < 0) PFATAL("Unable to create '%s'", fn);
    close(fd);

  }

  ck_free(ldest);
  ck_free(fn);

  q->var_behavior = 1;

}


/* Mark / unmark as redundant (edge-only). This is not used for restoring state,
   but may be useful for post-processing datasets. */

static void mark_as_redundant(struct queue_entry* q, u8 state) {

  u8* fn;
  s32 fd;

  if (state == q->fs_redundant) return;

  q->fs_redundant = state;

  fn = strrchr(q->fname, '/');
  fn = alloc_printf("%s/queue/.state/redundant_edges/%s", out_dir, fn + 1);

  if (state) {

    fd = open(fn, O_WRONLY | O_CREAT | O_EXCL, 0600);
    if (fd < 0) PFATAL("Unable to create '%s'", fn);
    close(fd);

  } else {

    if (unlink(fn)) PFATAL("Unable to remove '%s'", fn);

  }

  ck_free(fn);

}

/* Append new test case to the queue. */

static void add_to_queue(u8* fname, u32 len, u8 passed_det) {

	struct queue_entry* q = ck_alloc(sizeof(struct queue_entry));

	q->fname        = fname;
	q->len          = len;
	q->depth        = cur_depth + 1;
	q->passed_det   = passed_det;

	if (q->depth > max_depth) max_depth = q->depth;

	if (queue_top) {

		queue_top->next = q;
		queue_top = q;

	} else q_prev100 = queue = queue_top = q;

	queued_paths++;
	pending_not_fuzzed++;

	cycles_wo_finds = 0;

	if (!(queued_paths % 100)) {

		q_prev100->next_100 = q;
		q_prev100 = q;

	}

	last_path_time = get_cur_time();

}


/* Destroy the entire queue. */

EXP_ST void destroy_queue(void) {

	struct queue_entry *q = queue, *n;

	while (q) {

		n = q->next;
		ck_free(q->fname);
		ck_free(q->trace_mini);
		ck_free(q);
		q = n;

	}

}


/* Write bitmap to file. The bitmap is useful mostly for the secret
   -B option, to focus a separate fuzzing session on a particular
   interesting input without rediscovering all the others. */

EXP_ST void write_bitmap(void) {

	u8* fname;
	s32 fd;

	if (!bitmap_changed) return;
	bitmap_changed = 0;

	fname = alloc_printf("%s/fuzz_bitmap", out_dir);
	fd = open(fname, O_WRONLY | O_CREAT | O_TRUNC, 0600);

	if (fd < 0) PFATAL("Unable to open '%s'", fname);

	ck_write(fd, virgin_bits, MAP_SIZE, fname);

	close(fd);
	ck_free(fname);

}


/* Check if the current execution path brings anything new to the table.
   Update virgin bits to reflect the finds. Returns 1 if the only change is
   the hit-count for a particular tuple; 2 if there are new tuples seen. 
   Updates the map, so subsequent calls will always return 0.

   This function is called after every exec() on a fairly large buffer, so
   it needs to be fast. We do this in 32-bit and 64-bit flavors. */

static inline u8 has_new_bits(u8* virgin_map) {

	printf("\t-> in has_new_bits\n");


#ifdef __x86_64__

	u64* current = (u64*)trace_bits;
	u64* virgin  = (u64*)virgin_map;

	u32  i = (MAP_SIZE >> 3);

#else

	u32* current = (u32*)trace_bits;
	u32* virgin  = (u32*)virgin_map;

	u32  i = (MAP_SIZE >> 2);

#endif /* ^__x86_64__ */

	u8   ret = 0;

  // are we passing through the entire map and check if anything changed???

	while (i--) {

    /* Optimize for (*current & *virgin) == 0 - i.e., no bits in current bitmap
       that have not been already cleared from the virgin map - since this will
       almost always be the case. */

		if (unlikely(*current) && unlikely(*current & *virgin)) {

			if (likely(ret < 2)) {

				u8* cur = (u8*)current;
				u8* vir = (u8*)virgin;

        //printf("cur = 0x%08x\n", *cur);
        //printf("vir = 0x%08x\n", *vir);

        /* Looks like we have not found any new bytes yet; see if any non-zero
           bytes in current[] are pristine in virgin[]. */

#ifdef __x86_64__

				if ((cur[0] && vir[0] == 0xff) || (cur[1] && vir[1] == 0xff) ||
					(cur[2] && vir[2] == 0xff) || (cur[3] && vir[3] == 0xff) ||
					(cur[4] && vir[4] == 0xff) || (cur[5] && vir[5] == 0xff) ||
					(cur[6] && vir[6] == 0xff) || (cur[7] && vir[7] == 0xff)) ret = 2;
					else ret = 1;

#else

				if ((cur[0] && vir[0] == 0xff) || (cur[1] && vir[1] == 0xff) ||
					(cur[2] && vir[2] == 0xff) || (cur[3] && vir[3] == 0xff)) ret = 2;
					else ret = 1;

#endif /* ^__x86_64__ */

			}

			*virgin &= ~*current;

		}

		current++;
		virgin++;

  } // end of while

  if (ret && virgin_map == virgin_bits) bitmap_changed = 1;

  return ret;

}


/* Count the number of bits set in the provided bitmap. Used for the status
   screen several times every second, does not have to be fast. */

static u32 count_bits(u8* mem) {

	u32* ptr = (u32*)mem;
	u32  i   = (MAP_SIZE >> 2);
	u32  ret = 0;

	while (i--) {

		u32 v = *(ptr++);

    /* This gets called on the inverse, virgin bitmap; optimize for sparse
       data. */

		if (v == 0xffffffff) {
			ret += 32;
			continue;
		}

		v -= ((v >> 1) & 0x55555555);
		v = (v & 0x33333333) + ((v >> 2) & 0x33333333);
		ret += (((v + (v >> 4)) & 0xF0F0F0F) * 0x01010101) >> 24;

	}

	return ret;

}


#define FF(_b)  (0xff << ((_b) << 3))

/* Count the number of bytes set in the bitmap. Called fairly sporadically,
   mostly to update the status screen or calibrate and examine confirmed
   new paths. */

static u32 count_bytes(u8* mem) {

	u32* ptr = (u32*)mem;
	u32  i   = (MAP_SIZE >> 2);
	u32  ret = 0;

	while (i--) {

		u32 v = *(ptr++);

		if (!v) continue;
		if (v & FF(0)) ret++;
		if (v & FF(1)) ret++;
		if (v & FF(2)) ret++;
		if (v & FF(3)) ret++;

	}

	return ret;

}


/* Count the number of non-255 bytes set in the bitmap. Used strictly for the
   status screen, several calls per second or so. */

static u32 count_non_255_bytes(u8* mem) {

	u32* ptr = (u32*)mem;
	u32  i   = (MAP_SIZE >> 2);
	u32  ret = 0;

	while (i--) {

		u32 v = *(ptr++);

    /* This is called on the virgin bitmap, so optimize for the most likely
       case. */

		if (v == 0xffffffff) continue;
		if ((v & FF(0)) != FF(0)) ret++;
		if ((v & FF(1)) != FF(1)) ret++;
		if ((v & FF(2)) != FF(2)) ret++;
		if ((v & FF(3)) != FF(3)) ret++;

	}

	return ret;

}


/* Destructively simplify trace by eliminating hit count information
   and replacing it with 0x80 or 0x01 depending on whether the tuple
   is hit or not. Called on every new crash or timeout, should be
   reasonably fast. */

static const u8 simplify_lookup[256] = { 

	[0]         = 1,
	[1 ... 255] = 128

};

/* Destructively classify execution counts in a trace. This is used as a
   preprocessing step for any newly acquired traces. Called on every exec,
   must be fast. */

static const u8 count_class_lookup8[256] = {

	[0]           = 0,
	[1]           = 1,
	[2]           = 2,
	[3]           = 4,
	[4 ... 7]     = 8,
	[8 ... 15]    = 16,
	[16 ... 31]   = 32,
	[32 ... 127]  = 64,
	[128 ... 255] = 128

};

static u16 count_class_lookup16[65536];


EXP_ST void init_count_class16(void) {

	u32 b1, b2;

	for (b1 = 0; b1 < 256; b1++) 
		for (b2 = 0; b2 < 256; b2++)
			count_class_lookup16[(b1 << 8) + b2] = 
		(count_class_lookup8[b1] << 8) |
		count_class_lookup8[b2];

	}


#ifdef __x86_64__

	static inline void classify_counts(u64* mem) {

  //printf("\t -> in classify_counts\n");
		int count = 0;
		u32 i = MAP_SIZE >> 3;

		while (i--) {

  	//printf("0x%08x\n", mem);

    /* Optimize for sparse bitmaps. */

			if (unlikely(*mem)) {

      //printf("0x%08x\n", *mem);

				count ++;

				u16* mem16 = (u16*)mem;

				mem16[0] = count_class_lookup16[mem16[0]];
				mem16[1] = count_class_lookup16[mem16[1]];
				mem16[2] = count_class_lookup16[mem16[2]];
				mem16[3] = count_class_lookup16[mem16[3]];

			}

			mem++;

		}

	}

#else

	static inline void classify_counts(u32* mem) {

		u32 i = MAP_SIZE >> 2;

		printf("i = %d\n", i);

		while (i--) {

    /* Optimize for sparse bitmaps. */

			if (unlikely(*mem)) {

				u16* mem16 = (u16*)mem;

				mem16[0] = count_class_lookup16[mem16[0]];
				mem16[1] = count_class_lookup16[mem16[1]];

			}

			mem++;

		}

	}

#endif /* ^__x86_64__ */


/* Get rid of shared memory (atexit handler). */

	static void remove_shm(void) {

		shmctl(shm_id, IPC_RMID, NULL);
  //shmctl(shm_id2, IPC_RMID, NULL);
	}


/* Compact trace bytes into a smaller bitmap. We effectively just drop the
   count information here. This is called only sporadically, for some
   new paths. */

	static void minimize_bits(u8* dst, u8* src) {

		u32 i = 0;

		while (i < MAP_SIZE) {

			if (*(src++)) dst[i >> 3] |= 1 << (i & 7);
			i++;

		}

	}

	/* When we bump into a new path, we call this to see if the path appears
   more "favorable" than any of the existing ones. The purpose of the
   "favorables" is to have a minimal set of paths that trigger all the bits
   seen in the bitmap so far, and focus on fuzzing them at the expense of
   the rest.

   The first step of the process is to maintain a list of top_rated[] entries
   for every byte in the bitmap. We win that slot if there is no previous
   contender, or if the contender has a more favorable speed x size factor. */

static void update_bitmap_score(struct queue_entry* q) {

  u32 i;
  u64 fav_factor = q->exec_us * q->len;

  /* For every byte set in trace_bits[], see if there is a previous winner,
     and how it compares to us. */

  for (i = 0; i < MAP_SIZE; i++)

    if (trace_bits[i]) {

       if (top_rated[i]) {

         /* Faster-executing or smaller test cases are favored. */

         if (fav_factor > top_rated[i]->exec_us * top_rated[i]->len) continue;

         /* Looks like we're going to win. Decrease ref count for the
            previous winner, discard its trace_bits[] if necessary. */

         if (!--top_rated[i]->tc_ref) {
           ck_free(top_rated[i]->trace_mini);
           top_rated[i]->trace_mini = 0;
         }

       }

       /* Insert ourselves as the new winner. */

       top_rated[i] = q;
       q->tc_ref++;

       if (!q->trace_mini) {
         q->trace_mini = ck_alloc(MAP_SIZE >> 3);
         minimize_bits(q->trace_mini, trace_bits);
       }

       score_changed = 1;

     }

}

/* The second part of the mechanism discussed above is a routine that
   goes over top_rated[] entries, and then sequentially grabs winners for
   previously-unseen bytes (temp_v) and marks them as favored, at least
   until the next run. The favored entries are given more air time during
   all fuzzing steps. */

static void cull_queue(void) {

  struct queue_entry* q;
  static u8 temp_v[MAP_SIZE >> 3];
  u32 i;

  if (dumb_mode || !score_changed) return;

  score_changed = 0;

  memset(temp_v, 255, MAP_SIZE >> 3);

  queued_favored  = 0;
  pending_favored = 0;

  q = queue;

  while (q) {
    q->favored = 0;
    q = q->next;
  }

  /* Let's see if anything in the bitmap isn't captured in temp_v.
     If yes, and if it has a top_rated[] contender, let's use it. */

  for (i = 0; i < MAP_SIZE; i++)
    if (top_rated[i] && (temp_v[i >> 3] & (1 << (i & 7)))) {

      u32 j = MAP_SIZE >> 3;

      /* Remove all bits belonging to the current entry from temp_v. */

      while (j--) 
        if (top_rated[i]->trace_mini[j])
          temp_v[j] &= ~top_rated[i]->trace_mini[j];

      top_rated[i]->favored = 1;
      queued_favored++;

      if (!top_rated[i]->was_fuzzed) pending_favored++;

    } // end of if and for

  q = queue;

  while (q) {
    mark_as_redundant(q, !q->favored);
    q = q->next;
  }

}

/* Configure shared memory and virgin_bits. This is called at startup. */
// TODO -> add mulitple ids
EXP_ST void setup_shm(void) {

	u8* shm_str;

	if (!in_bitmap) memset(virgin_bits, 255, MAP_SIZE);

	memset(virgin_tmout, 255, MAP_SIZE);
	memset(virgin_crash, 255, MAP_SIZE);

	shm_id = shmget(IPC_PRIVATE, MAP_SIZE, IPC_CREAT | IPC_EXCL | 0600);
	//printf("shm_id = %d\n", shm_id);
	//shm_id2 = shmget(IPC_PRIVATE, MAP_SIZE, IPC_CREAT | IPC_EXCL | 0600);
	//printf("shm_id2 = %d\n", shm_id2);
		


	if ( shm_id < 0 ) PFATAL("shmget() failed");

	atexit(remove_shm);

	shm_str = alloc_printf("%d", shm_id);
	 

	  /* If somebody is asking us to fuzz instrumented binaries in dumb mode,
	     we don't want them to detect instrumentation, since we won't be sending
	     fork server commands. This should be replaced with better auto-detection
	     later on, perhaps? */

	if (!dumb_mode){ 
		setenv(SHM_ENV_VAR, shm_str, 1);
	}

	ck_free(shm_str);

	trace_bits = shmat(shm_id, NULL, 0); //attach the shared memory address segment to trace_bits
	  
	if (!trace_bits) PFATAL("shmat() failed");

}


/* Load postprocessor, if available. */

static void setup_post(void) {

  void* dh;
  u8* fn = getenv("AFL_POST_LIBRARY");
  u32 tlen = 6;

  if (!fn) return;

  ACTF("Loading postprocessor from '%s'...", fn);

  dh = dlopen(fn, RTLD_NOW);
  if (!dh) FATAL("%s", dlerror());

  post_handler = dlsym(dh, "afl_postprocess");
  if (!post_handler) FATAL("Symbol 'afl_postprocess' not found.");

  /* Do a quick test. It's better to segfault now than later =) */

  post_handler("hello", &tlen);

  OKF("Postprocessor installed successfully.");

}

/* Read all testcases from the input directory, then queue them for testing.
   Called at startup. */

static void read_testcases(void) {

	struct dirent **nl;
	s32 nl_cnt;
	u32 i;
	u8* fn;

  /* Auto-detect non-in-place resumption attempts. */

	fn = alloc_printf("%s/queue", in_dir);
	if (!access(fn, F_OK)) in_dir = fn; else ck_free(fn);

	ACTF("Scanning '%s'...", in_dir);

  /* We use scandir() + alphasort() rather than readdir() because otherwise,
     the ordering  of test cases would vary somewhat randomly and would be
     difficult to control. */

	nl_cnt = scandir(in_dir, &nl, NULL, alphasort);

	if (nl_cnt < 0) {

		if (errno == ENOENT || errno == ENOTDIR)

			SAYF("\n" cLRD "[-] " cRST
				"The input directory does not seem to be valid - try again. The fuzzer needs\n"
				"    one or more test case to start with - ideally, a small file under 1 kB\n"
				"    or so. The cases must be stored as regular files directly in the input\n"
				"    directory.\n");

		PFATAL("Unable to open '%s'", in_dir);

	}

	if (shuffle_queue && nl_cnt > 1) {

		ACTF("Shuffling queue...");
		shuffle_ptrs((void**)nl, nl_cnt);

	}

	for (i = 0; i < nl_cnt; i++) {

		struct stat st;

		u8* fn = alloc_printf("%s/%s", in_dir, nl[i]->d_name);
		u8* dfn = alloc_printf("%s/.state/deterministic_done/%s", in_dir, nl[i]->d_name);

		u8  passed_det = 0;

    free(nl[i]); /* not tracked */

		if (lstat(fn, &st) || access(fn, R_OK))
			PFATAL("Unable to access '%s'", fn);

    /* This also takes care of . and .. */

		if (!S_ISREG(st.st_mode) || !st.st_size || strstr(fn, "/README.txt")) {

			ck_free(fn);
			ck_free(dfn);
			continue;

		}

		if (st.st_size > MAX_FILE) 
			FATAL("Test case '%s' is too big (%s, limit is %s)", fn,
				DMS(st.st_size), DMS(MAX_FILE));

    /* Check for metadata that indicates that deterministic fuzzing
       is complete for this entry. We don't want to repeat deterministic
       fuzzing when resuming aborted scans, because it would be pointless
       and probably very time-consuming. */

		if (!access(dfn, F_OK)) passed_det = 1;
		ck_free(dfn);

		add_to_queue(fn, st.st_size, passed_det);

	}

  free(nl); /* not tracked */

	if (!queued_paths) {

		SAYF("\n" cLRD "[-] " cRST
			"Looks like there are no valid test cases in the input directory! The fuzzer\n"
			"    needs one or more test case to start with - ideally, a small file under\n"
			"    1 kB or so. The cases must be stored as regular files directly in the\n"
			"    input directory.\n");

		FATAL("No usable test cases in '%s'", in_dir);

	}

	last_path_time = 0;
	queued_at_start = queued_paths;

}

/* Helper function for load_extras. */

static int compare_extras_len(const void* p1, const void* p2) {
  struct extra_data *e1 = (struct extra_data*)p1,
                    *e2 = (struct extra_data*)p2;

  return e1->len - e2->len;
}

static int compare_extras_use_d(const void* p1, const void* p2) {
  struct extra_data *e1 = (struct extra_data*)p1,
                    *e2 = (struct extra_data*)p2;

  return e2->hit_cnt - e1->hit_cnt;
}

/* Helper function for maybe_add_auto() */

static inline u8 memcmp_nocase(u8* m1, u8* m2, u32 len) {

	while (len--) if (tolower(*(m1++)) ^ tolower(*(m2++))) return 1;
	return 0;

}

/* Maybe add automatic extra. */

static void maybe_add_auto(u8* mem, u32 len) {

  u32 i;

  /* Allow users to specify that they don't want auto dictionaries. */

  if (!MAX_AUTO_EXTRAS || !USE_AUTO_EXTRAS) return;

  /* Skip runs of identical bytes. */

  for (i = 1; i < len; i++)
    if (mem[0] ^ mem[i]) break;

  if (i == len) return;

  /* Reject builtin interesting values. */

  if (len == 2) {

    i = sizeof(interesting_16) >> 1;

    while (i--) 
      if (*((u16*)mem) == interesting_16[i] ||
          *((u16*)mem) == SWAP16(interesting_16[i])) return;

  }

  if (len == 4) {

    i = sizeof(interesting_32) >> 2;

    while (i--) 
      if (*((u32*)mem) == interesting_32[i] ||
          *((u32*)mem) == SWAP32(interesting_32[i])) return;

  }

  /* Reject anything that matches existing extras. Do a case-insensitive
     match. We optimize by exploiting the fact that extras[] are sorted
     by size. */

  for (i = 0; i < extras_cnt; i++)
    if (extras[i].len >= len) break;

  for (; i < extras_cnt && extras[i].len == len; i++)
    if (!memcmp_nocase(extras[i].data, mem, len)) return;

  /* Last but not least, check a_extras[] for matches. There are no
     guarantees of a particular sort order. */

  auto_changed = 1;

  for (i = 0; i < a_extras_cnt; i++) {

    if (a_extras[i].len == len && !memcmp_nocase(a_extras[i].data, mem, len)) {

      a_extras[i].hit_cnt++;
      goto sort_a_extras;

    }

  }

  /* At this point, looks like we're dealing with a new entry. So, let's
     append it if we have room. Otherwise, let's randomly evict some other
     entry from the bottom half of the list. */

  if (a_extras_cnt < MAX_AUTO_EXTRAS) {

    a_extras = ck_realloc_block(a_extras, (a_extras_cnt + 1) *
                                sizeof(struct extra_data));

    a_extras[a_extras_cnt].data = ck_memdup(mem, len);
    a_extras[a_extras_cnt].len  = len;
    a_extras_cnt++;

  } else {

    i = MAX_AUTO_EXTRAS / 2 +
        UR((MAX_AUTO_EXTRAS + 1) / 2);

    ck_free(a_extras[i].data);

    a_extras[i].data    = ck_memdup(mem, len);
    a_extras[i].len     = len;
    a_extras[i].hit_cnt = 0;

  }

sort_a_extras:

  /* First, sort all auto extras by use count, descending order. */

  qsort(a_extras, a_extras_cnt, sizeof(struct extra_data),
        compare_extras_use_d);

  /* Then, sort the top USE_AUTO_EXTRAS entries by size. */

  qsort(a_extras, MIN(USE_AUTO_EXTRAS, a_extras_cnt),
        sizeof(struct extra_data), compare_extras_len);

}


/* Save automatically generated extras. */

static void save_auto(void) {

	u32 i;

	if (!auto_changed) return;
	auto_changed = 0;

	for (i = 0; i < MIN(USE_AUTO_EXTRAS, a_extras_cnt); i++) {

		u8* fn = alloc_printf("%s/queue/.state/auto_extras/auto_%06u", out_dir, i);
		s32 fd;

		fd = open(fn, O_WRONLY | O_CREAT | O_TRUNC, 0600);

		if (fd < 0) PFATAL("Unable to create '%s'", fn);

		ck_write(fd, a_extras[i].data, a_extras[i].len, fn);

		close(fd);
		ck_free(fn);

	}

}


/* Load automatically generated extras. */

static void load_auto(void) {

  u32 i;

  for (i = 0; i < USE_AUTO_EXTRAS; i++) {

    u8  tmp[MAX_AUTO_EXTRA + 1];
    u8* fn = alloc_printf("%s/.state/auto_extras/auto_%06u", in_dir, i);
    s32 fd, len;

    fd = open(fn, O_RDONLY, 0600);

    if (fd < 0) {

      if (errno != ENOENT) PFATAL("Unable to open '%s'", fn);
      ck_free(fn);
      break;

    }

    /* We read one byte more to cheaply detect tokens that are too
       long (and skip them). */

    len = read(fd, tmp, MAX_AUTO_EXTRA + 1);

    if (len < 0) PFATAL("Unable to read from '%s'", fn);

    if (len >= MIN_AUTO_EXTRA && len <= MAX_AUTO_EXTRA)
      maybe_add_auto(tmp, len);

    close(fd);
    ck_free(fn);

  }

  if (i) OKF("Loaded %u auto-discovered dictionary tokens.", i);
  else OKF("No auto-generated dictionary tokens to reuse.");

}


/* Destroy extras. */

static void destroy_extras(void) {

	u32 i;

	for (i = 0; i < extras_cnt; i++) 
		ck_free(extras[i].data);

	ck_free(extras);

	for (i = 0; i < a_extras_cnt; i++) 
		ck_free(a_extras[i].data);

	ck_free(a_extras);

}


//FORKSRV_FD
EXP_ST void init_forkserver_special(char** argv, u8 **path, s32 *forksrv_pid, 
								s32 *fsrv_ctl_fd,s32 *fsrv_st_fd, int fork_srv) {

	printf("\t-> init_forkserver\n");

	static struct itimerval it;
	int st_pipe[2], ctl_pipe[2];
	int status;
	s32 rlen;

	ACTF("Spinning up the fork server...");

	if (pipe(st_pipe) || pipe(ctl_pipe)) PFATAL("pipe() failed");
	//printf("\t----------is gonna stop me = %d\n",fcntl(st_pipe[1], F_SETFL, O_NONBLOCK));
	//fcntl(*fsrv_st_fd, F_SETFL, O_NONBLOCK);


	*forksrv_pid = fork();

	if (*forksrv_pid < 0) PFATAL("fork() failed");

	if (!*forksrv_pid) {

		printf("not forksrv_pid\n");


		struct rlimit r;

    /* Umpf. On OpenBSD, the default fd limit for root users is set to
       soft 128. Let's try to fix that... */

		if (!getrlimit(RLIMIT_NOFILE, &r) && r.rlim_cur < fork_srv + 2) {

			r.rlim_cur = fork_srv + 2;
      setrlimit(RLIMIT_NOFILE, &r); /* Ignore errors */

		}

		if (mem_limit) {

			r.rlim_max = r.rlim_cur = ((rlim_t)mem_limit) << 20;

#ifdef RLIMIT_AS

      setrlimit(RLIMIT_AS, &r); /* Ignore errors */

#else

      /* This takes care of OpenBSD, which doesn't have RLIMIT_AS, but
         according to reliable sources, RLIMIT_DATA covers anonymous
         maps - so we should be getting good protection against OOM bugs. */

      setrlimit(RLIMIT_DATA, &r); /* Ignore errors */

#endif /* ^RLIMIT_AS */


		}

    /* Dumping cores is slow and can lead to anomalies if SIGKILL is delivered
       before the dump is complete. */

		r.rlim_max = r.rlim_cur = 0;

    setrlimit(RLIMIT_CORE, &r); /* Ignore errors */

    /* Isolate the process and configure standard descriptors. If out_file is
       specified, stdin is /dev/null; otherwise, out_fd is cloned instead. */

		setsid();

		printf("before redirecting standard output\n");

    dup2(dev_null_fd, 1); // redirect standard output to dev_null_fd
    dup2(dev_null_fd, 2); // redirect the standard error to the dev_null_fd

    //SAYF("after redirecting standard output\n");

    if (out_file) {
    	dup2(dev_null_fd, 0);

    } else {
      //enters here
    	dup2(out_fd, 0);
    	close(out_fd);

    }

    /* Set up control and status pipes, close the unneeded original fds. */

    if (dup2(ctl_pipe[0], fork_srv) < 0) PFATAL("dup2() failed"); //need to change here
    if (dup2(st_pipe[1], fork_srv + 1) < 0) PFATAL("dup2() failed"); //need to change here

    close(ctl_pipe[0]);
    close(ctl_pipe[1]);
    close(st_pipe[0]);
    close(st_pipe[1]);

    close(out_dir_fd);
    close(dev_null_fd);
    close(dev_urandom_fd);
    close(fileno(plot_file));

    /* This should improve performance a bit, since it stops the linker from
       doing extra work post-fork(). */

    if (!getenv("LD_BIND_LAZY")) setenv("LD_BIND_NOW", "1", 0);

    /* Set sane defaults for ASAN if nothing else specified. */

    setenv("ASAN_OPTIONS", "abort_on_error=1:"
                           "detect_leaks=1:" //changed this part here
                           "symbolize=1:" //changed this part here
                           "allocator_may_return_null=1", 0);

    /* MSAN is tricky, because it doesn't support abort_on_error=1 at this
       point. So, we do this in a very hacky way. */

    setenv("MSAN_OPTIONS", "exit_code=" STRINGIFY(MSAN_ERROR) ":"
    	"symbolize=0:"
    	"abort_on_error=1:"
    	"allocator_may_return_null=1:"
    	"msan_track_origins=0", 0);

    execv(*path, argv);

    /* Use a distinctive bitmap signature to tell the parent about execv()
       falling through. */

    *(u32*)trace_bits = EXEC_FAIL_SIG;
    exit(0);

}

  /* Close the unneeded endpoints. */

close(ctl_pipe[0]);
close(st_pipe[1]);

*fsrv_ctl_fd = ctl_pipe[1];
*fsrv_st_fd  = st_pipe[0];

//fcntl(*fsrv_st_fd, F_GETFL, F_SETFL, O_NONBLOCK);
  /* Wait for the fork server to come up, but don't wait too long. */

it.it_value.tv_sec = ((exec_tmout * FORK_WAIT_MULT) / 1000);
it.it_value.tv_usec = ((exec_tmout * FORK_WAIT_MULT) % 1000) * 1000;

setitimer(ITIMER_REAL, &it, NULL);

rlen = read(*fsrv_st_fd, &status, 4);

it.it_value.tv_sec = 0;
it.it_value.tv_usec = 0;

setitimer(ITIMER_REAL, &it, NULL);

  /* If we have a four-byte "hello" message from the server, we're all set.
     Otherwise, try to figure out what went wrong. */

if (rlen == 4) {
	OKF("All right - fork server is up. For both files and working");

	return;
}

if (child_timed_out)
	FATAL("Timeout while initializing fork server (adjusting -t may help)");

if (waitpid(*forksrv_pid, &status, 0) <= 0)
	PFATAL("waitpid() failed");

if (WIFSIGNALED(status)) {

	if (mem_limit && mem_limit < 500 && uses_asan) {

		SAYF("\n" cLRD "[-] " cRST
			"Whoops, the target binary crashed suddenly, before receiving any input\n"
			"    from the fuzzer! Since it seems to be built with ASAN and you have a\n"
			"    restrictive memory limit configured, this is expected; please read\n"
			"    %s/notes_for_asan.txt for help.\n", doc_path);

	} else if (!mem_limit) {

		SAYF("\n" cLRD "[-] " cRST
			"Whoops, the target binary crashed suddenly, before receiving any input\n"
			"    from the fuzzer! There are several probable explanations:\n\n"

			"    - The binary is just buggy and explodes entirely on its own. If so, you\n"
			"      need to fix the underlying problem or find a better replacement.\n\n"

			"    - Less likely, there is a horrible bug in the fuzzer. If other options\n"
			"      fail, poke <lcamtuf@coredump.cx> for troubleshooting tips.\n");

	} else {

		SAYF("\n" cLRD "[-] " cRST
			"Whoops, the target binary crashed suddenly, before receiving any input\n"
			"    from the fuzzer! There are several probable explanations:\n\n"

			"    - The current memory limit (%s) is too restrictive, causing the\n"
			"      target to hit an OOM condition in the dynamic linker. Try bumping up\n"
			"      the limit with the -m setting in the command line. A simple way confirm\n"
			"      this diagnosis would be:\n\n"

#ifdef RLIMIT_AS
			"      ( ulimit -Sv $[%llu << 10]; /path/to/fuzzed_app )\n\n"
#else
			"      ( ulimit -Sd $[%llu << 10]; /path/to/fuzzed_app )\n\n"
#endif /* ^RLIMIT_AS */

			"      Tip: you can use http://jwilk.net/software/recidivm to quickly\n"
			"      estimate the required amount of virtual memory for the binary.\n\n"

			"    - The binary is just buggy and explodes entirely on its own. If so, you\n"
			"      need to fix the underlying problem or find a better replacement.\n\n"

#ifdef __APPLE__

			"    - On MacOS X, the semantics of fork() syscalls are non-standard and may\n"
			"      break afl-fuzz performance optimizations when running platform-specific\n"
			"      targets. To fix this, set AFL_NO_FORKSRV=1 in the environment.\n\n"

#endif /* __APPLE__ */

			"    - Less likely, there is a horrible bug in the fuzzer. If other options\n"
			"      fail, poke <lcamtuf@coredump.cx> for troubleshooting tips.\n",
			DMS(mem_limit << 20), mem_limit - 1);

	}

	FATAL("Fork server crashed with signal %d", WTERMSIG(status));

}

if (*(u32*)trace_bits == EXEC_FAIL_SIG)
	FATAL("Unable to execute target application ('%s')", argv[0]);

if (mem_limit && mem_limit < 500 && uses_asan) {

	SAYF("\n" cLRD "[-] " cRST
		"Hmm, looks like the target binary terminated before we could complete a\n"
		"    handshake with the injected code. Since it seems to be built with ASAN and\n"
		"    you have a restrictive memory limit configured, this is expected; please\n"
		"    read %s/notes_for_asan.txt for help.\n", doc_path);

} else if (!mem_limit) {

	SAYF("\n" cLRD "[-] " cRST
		"Hmm, looks like the target binary terminated before we could complete a\n"
		"    handshake with the injected code. Perhaps there is a horrible bug in the\n"
		"    fuzzer. Poke <lcamtuf@coredump.cx> for troubleshooting tips.\n");

} else {

	SAYF("\n" cLRD "[-] " cRST
		"Hmm, looks like the target binary terminated before we could complete a\n"
		"    handshake with the injected code. There are %s probable explanations:\n\n"

		"%s"
		"    - The current memory limit (%s) is too restrictive, causing an OOM\n"
		"      fault in the dynamic linker. This can be fixed with the -m option. A\n"
		"      simple way to confirm the diagnosis may be:\n\n"

#ifdef RLIMIT_AS
		"      ( ulimit -Sv $[%llu << 10]; /path/to/fuzzed_app )\n\n"
#else
		"      ( ulimit -Sd $[%llu << 10]; /path/to/fuzzed_app )\n\n"
#endif /* ^RLIMIT_AS */

		"      Tip: you can use http://jwilk.net/software/recidivm to quickly\n"
		"      estimate the required amount of virtual memory for the binary.\n\n"

		"    - Less likely, there is a horrible bug in the fuzzer. If other options\n"
		"      fail, poke <lcamtuf@coredump.cx> for troubleshooting tips.\n",
		getenv(DEFER_ENV_VAR) ? "three" : "two",
		getenv(DEFER_ENV_VAR) ?
		"    - You are using deferred forkserver, but __AFL_INIT() is never\n"
		"      reached before the program terminates.\n\n" : "",
		DMS(mem_limit << 20), mem_limit - 1);

}

FATAL("Fork server handshake failed");

}


/*
* Helper function for cmp_programs
* Returns the number of blocks hit by the current fuzzed program
* Puts the blocks on the argument
* This function should delay the actual fuzzing by a lot
* Not working for some reason
* 
*/
/*
int blocks_hit(int *blocks){

	printf("in blocks_hit %d\n", blocks == NULL);

	unsigned int size = 100, hit = 0;
	blocks = malloc(sizeof(int) * size);

	unsigned int id = 0;

	printf("before while\n");

	while( 1 ){

		// check if there are things to read
		if( poll(&(struct pollfd){ .fd=fsrv_st_fd, .events = POLLIN }, 1, -1) != 1) //especialmente aqui, tentar arranjar uma maneira melhor (Isto é muito caro)
		    break;

		if (read(fsrv_st_fd, &id, 4) != 4) { //-WRITE
		   	RPFATAL(-1, "Unable to read block_id from fork server (OOM?)");
		}
		
		hit++;

		//check if we have enough memory allocated for the array
		if( hit >= size * 0.75 ){
			size *= 2;
			blocks = realloc(blocks, sizeof(int) * size );
		}

		//printf("before weird looking line\n");

		*blocks = id;
		printf("*block_hit = 0x%08x\n", *blocks);
		//printf("after weird looking line\n");
		blocks++;
		//printf("after = 0x%08x\n", id);
		
		    	    //printf("1\n");
	}

	return hit;

}
*/

/**
*
* RUNS specific forkserver specified in fsrv_ctl_fd and fsrv_st_fd
* Stores the reason the program crashed in fault, if it does not crash FAULT_NONE
* Stores the amount of blocks found in hit
*
**/
int *run_forkserver_on_target(u32 timeout, int *hit, s32 fsrv_ctl_fd,s32 fsrv_st_fd, u8 *fault){
	printf("\t-> in run_forkserver_on_target\n");

	static struct itimerval it;
	static u32 prev_timed_out = 0;
	u32 tb4;

	int status = 0;
	//u32 tb4;

	child_timed_out = 0;

	  /* After this memset, trace_bits[] are effectively volatile, so we
	     must prevent any earlier operations from venturing into that
	     territory. */

	memset(trace_bits, 0, MAP_SIZE);
	MEM_BARRIER();

//issue -> are both of the programs running?

	s32 res;

    //start of the forkserver

    if ((res = write(fsrv_ctl_fd, &prev_timed_out, 4)) != 4) { //-WRITE

    	if (stop_soon) return 0;
    	RPFATAL(res, "Unable to request new process from fork server (OOM?)");

    }

    //printf("%d\n", &prev_timed_out);

    if ((res = read(fsrv_st_fd, &child_pid, 4)) != 4) { //-READ

    	  printf("res = %d\n", res);

    	if (stop_soon) return 0;
    	RPFATAL(res, "Unable to request new process from fork server (OOM?)");

    }

    if (child_pid <= 0) FATAL("Fork server is misbehaving (OOM?)");

	 /* Configure timeout, as requested by user, then wait for child to terminate. */

	it.it_value.tv_sec = (timeout / 1000);
	it.it_value.tv_usec = (timeout % 1000) * 1000;

	setitimer(ITIMER_REAL, &it, NULL); //check out

    // relays the wait status and then should leave

	/* The SIGALRM handler simply kills the child_pid and sets child_timed_out. */

	if ((res = read(fsrv_st_fd, &status, 4)) != 4) { // TODO -> check it out a bit more 

		if (stop_soon) return 0;
		RPFATAL(res, "Unable to communicate with fork server (OOM?)");

	}
	printf("status = %d\n", status);
	// try to understand what's going on
	
  	if (!WIFSTOPPED(status)) child_pid = 0;
  	/*
  	it.it_value.tv_sec = 0;
  	it.it_value.tv_usec = 0;

  	setitimer(ITIMER_REAL, &it, NULL);
  	total_execs++;
	*/

	unsigned int size = 100;
	*hit = 0;

	int *blocks = malloc( sizeof(int) * size );

	if(!blocks){
		FATAL("malloc failed in run_forkserver_on_target");
	}

	unsigned int id = 0, i = 0;

	// TODO: for some reason, the last block we read is typically garbage, try to figure out why
	// for now, we simply ignore the last one when comparing
	

	while( 1 ){

		//printf("poll\n");
		if(WIFSTOPPED(status)){ printf("Has stopped\n");break;}
		if(WIFEXITED(status)){ printf("Terminated normally\n");break;}
		if(WIFSIGNALED(status)){ printf("received signal from\n"); break;}
		// check if there are things to read
		//if( poll(&(struct pollfd){ .fd=fsrv_st_fd, .events = POLLIN }, 1, 10) != 1) //especialmente aqui, tentar arranjar uma maneira melhor (Isto é muito caro)
		//	 break;

		
			//there's something to read
			//printf("gonna try and read something\n");

			//read it
			if (read(fsrv_st_fd, &id, 4) != 4) { //-WRITE
			   	RPFATAL(-1, "Unable to read block_id from fork server (OOM?)");
			}
			

			*hit = *hit + 1;

			//check if we have enough memory allocated for the array
			if( *hit >= size * 0.75 ){
				size *= 2;
				blocks = realloc(blocks, sizeof(int) * size );

				if(!blocks){
					free( blocks );
					RPFATAL(-1, "Something went wrong when increasing the size of the block");
				}
			}

			*(blocks + i) = id;

			printf("*block_hit = 0x%08x\n", *(blocks + i));
			i++;	
	}
	
	//printf("left while\n");


	//if( blocks == NULL ) printf("blocks is null\n");
	//else printf("is not null\n");
		//exit(0);
	//}

  
  //if (!WIFSTOPPED(status)) child_pid = 0;

  it.it_value.tv_sec = 0;
  it.it_value.tv_usec = 0;

  setitimer(ITIMER_REAL, &it, NULL);
  total_execs++;
  

  /* Any subsequent operations on trace_bits must not be moved by the
     compiler below this point. Past this location, trace_bits[] behave
     very normally and do not have to be treated as volatile. */

  MEM_BARRIER();

  tb4 = *(u32*)trace_bits;

//TODO -> probably will need to change this
#ifdef __x86_64__
  classify_counts((u64*)trace_bits);
#else
  classify_counts((u32*)trace_bits);
#endif /* ^__x86_64__ */



  /* Report outcome to caller. */

  if (WIFSIGNALED(status) && !stop_soon) {

  	printf("status = %d\n", status);
  	printf("signal status = %d\n", WIFSIGNALED(status) );

  	printf("\treported outcome is a crash!\n");

    kill_signal = WTERMSIG(status);

    if (child_timed_out && kill_signal == SIGKILL) *fault = FAULT_TMOUT;

    else *fault = FAULT_CRASH;
  }

  /* A somewhat nasty hack for MSAN, which doesn't support abort_on_error and
     must use a special exit code. */

  else if (uses_asan && WEXITSTATUS(status) == MSAN_ERROR) {
    kill_signal = 0;
    *fault = FAULT_CRASH;
  }

  else *fault = FAULT_NONE;

  printf("\tfault = %d\n", *fault);

  return blocks;
}

//TODO -> this is where We'll implement the real run_target, for now is just a templace
// take the things here and put it in the run_forkserver
static u8 run_target(char** argv, u32 timeout) {

	static struct itimerval it;
	static u32 prev_timed_out = 0;

	int hit = 0;
	int status = 0;
	//u32 tb4;

	child_timed_out = 0;

	  /* After this memset, trace_bits[] are effectively volatile, so we
	     must prevent any earlier operations from venturing into that
	     territory. */

	memset(trace_bits, 0, MAP_SIZE);
	MEM_BARRIER();

//issue -> are both of the programs running?

	s32 res;

    //start of the forkserver

    if ((res = write(fsrv_ctl_fd, &prev_timed_out, 4)) != 4) { //-WRITE

    	if (stop_soon) return 0;
    	RPFATAL(res, "Unable to request new process from fork server (OOM?)");

    }

    //printf("%d\n", &prev_timed_out);

    if ((res = read(fsrv_st_fd, &child_pid, 4)) != 4) { //-READ

    	  printf("res = %d\n", res);

    	if (stop_soon) return 0;
    	RPFATAL(res, "Unable to request new process from fork server (OOM?)");

    }

    if (child_pid <= 0) FATAL("Fork server is misbehaving (OOM?)");

	 /* Configure timeout, as requested by user, then wait for child to terminate. */

	it.it_value.tv_sec = (timeout / 1000);
	it.it_value.tv_usec = (timeout % 1000) * 1000;

	setitimer(ITIMER_REAL, &it, NULL);

    // relays the wait status and then should leave

	if ((res = read(fsrv_st_fd, &status, 4)) != 4) {

		if (stop_soon) return 0;
		RPFATAL(res, "Unable to communicate with fork server (OOM?)");

	}

	unsigned int size = 100;
	hit = 0;

	int *blocks = malloc( sizeof(int) * size );

	if(!blocks){
		FATAL("malloc failed in run_forkserver_on_target");
	}

	unsigned int id = 0, i = 0;

	// TODO: for some reason, the last block we read is typically garbage, try to figure out why
	// for now, we simply ignore the last one when comparing

	while( 1 ){

		// check if there are things to read
		if( poll(&(struct pollfd){ .fd=fsrv_st_fd, .events = POLLIN }, 1, -1) != 1) //especialmente aqui, tentar arranjar uma maneira melhor (Isto é muito caro)
		    break;

		if (read(fsrv_st_fd, &id, 4) != 4) { //-WRITE
		   	RPFATAL(-1, "Unable to read block_id from fork server (OOM?)");
		}
		
		hit = hit + 1;

		//check if we have enough memory allocated for the array
		if( hit >= size * 0.75 ){
			size *= 2;
			blocks = realloc(blocks, sizeof(int) * size );

			if(!blocks){
				free( blocks );
				RPFATAL(-1, "Something went wrong when increasing the size of the block");
			}
		}

		*(blocks + i) = id;

		//printf("*block_hit = 0x%08x\n", *(blocks + i));
		i++;

	}


	//if( blocks == NULL ) printf("blocks is null\n");
	//else printf("is not null\n");
		//exit(0);
	//}

  if (!WIFSTOPPED(status)) child_pid = 0;

  it.it_value.tv_sec = 0;
  it.it_value.tv_usec = 0;

  setitimer(ITIMER_REAL, &it, NULL);

  total_execs++;

  /* Any subsequent operations on trace_bits must not be moved by the
     compiler below this point. Past this location, trace_bits[] behave
     very normally and do not have to be treated as volatile. */

  MEM_BARRIER();

#ifdef __x86_64__
  classify_counts((u64*)trace_bits);
#else
  classify_counts((u32*)trace_bits);
#endif /* ^__x86_64__ */



  /* Report outcome to caller. */

  if (WIFSIGNALED(status) && !stop_soon) {

    kill_signal = WTERMSIG(status);

    if (child_timed_out && kill_signal == SIGKILL) return FAULT_TMOUT;

    return FAULT_CRASH;

  }

  /* A somewhat nasty hack for MSAN, which doesn't support abort_on_error and
     must use a special exit code. */

  if (uses_asan && WEXITSTATUS(status) == MSAN_ERROR) {
    kill_signal = 0;
    return FAULT_CRASH;
  }

	return FAULT_NONE;
}

/**
* NOTES: the array size must be the lenght of the number of programs passed
* Runs fall programs passed only once  returning the blocks hit
* Used to check out if the instrumentation is correct in all programs
*
* Also sets in size the number of blocks in each program
* TODO -> add an array of faults that it returns
**/
static int** run_programs_once(u32 timeout, int *size[] ){

	//check if size ois of the correct length
	if( sizeof(size) / sizeof(int) != numbr_of_progs_under_test ){
		FATAL("Number of programs passed in value does not match number of programs passed in total");
	}

	int **blocks = malloc( sizeof( int* ) * numbr_of_progs_under_test ); 

	if(!blocks){
		FATAL("malloc failed running all the programs!");
	}
	u8 fault;
	// Get all the blocks of all programs under	test
	for(int i = 0 ; i < numbr_of_progs_under_test; i++){
		//blocks[i] = malloc( sizeof(int) );
		blocks[i]= run_forkserver_on_target(timeout, &(size[i]), fsrv_ctl_fd[i], fsrv_st_fd[i], &fault);
	}

	return blocks;
}

/*This function was based on cmp_program in the original afl-fuzz.c 2.52*/

static void cmp_program(char** argv, u32 timeout) {

	//printf("in cmp_programs\n");

	int **blocks = malloc( sizeof( int* ) * numbr_of_progs_under_test ); 

	if( !blocks ){
		FATAL("malloc failed when comparing programs!");
	}

	int size[numbr_of_progs_under_test];

	blocks = run_programs_once( timeout, size );

	if(*blocks == NULL){
		printf("First block is null\n");
		for(int i = 0; i < numbr_of_progs_under_test; i++){
			free( (blocks + i) );
		}
		exit(0);
	}

	int numbr_of_equal_blocks = 0;
	int j = 0;

	printf("gonna pass through all the values\n");

	
	//enquanto existir um ponteiro para o resultado dos blocks todos e um proximo
	//TODO -> only allows two programs for now
	int index = 0;
	while( *(blocks + index) ){
		if( j == size[index] ){	++index; j = 0;	break;} //try to make this better, we stop at the first one for now
		//printf("**block = 0x%08x\n", *(*(blocks) + j) );
		if(j + 1 == size[index]) break;
		printf("**block = 0x%08x\n", *(*(blocks + 1) + j) );
		if( *(*(blocks) + j) == *(*(blocks + 1) + j) ){ numbr_of_equal_blocks++;}

		j++;
	}

	for(int i = 0 ; i < numbr_of_progs_under_test; i++){
		free(blocks[i]);
	}
	free(blocks);
	
	//printf("number of equal blocks = %d\n", numbr_of_equal_blocks);
	double percentage = (double )numbr_of_equal_blocks / (double) size[0];
	printf("Programs share %.3f%% of blocks passed in the same order\n", (percentage * 100) );


}

/* Write modified data to file for testing. If out_file is set, the old file
   is unlinked and a new one is created. Otherwise, out_fd is rewound and
   truncated. */

	static void write_to_testcase(void* mem, u32 len) {

		s32 fd = out_fd;

		if (out_file) {

    unlink(out_file); /* Ignore errors. */

			fd = open(out_file, O_WRONLY | O_CREAT | O_EXCL, 0600);

			if (fd < 0) PFATAL("Unable to create '%s'", out_file);

		} else lseek(fd, 0, SEEK_SET);

		ck_write(fd, mem, len, out_file);

		if (!out_file) {

			if (ftruncate(fd, len)) PFATAL("ftruncate() failed");
			lseek(fd, 0, SEEK_SET);

		} else close(fd);

	}

	static void show_stats(void);


/* Calibrate a new test case. This is done when processing the input directory
   to warn about flaky or otherwise problematic test cases early on; and when
   new paths are discovered to detect variable behavior and so on. */

//TODO -> make this work here, since it was working for a single program, but we need with n
//	-> probably gonna need to pass one more argument to add int
//	-> IDEA: run the passed program once, check the fault, return it, simple as that

static u8 calibrate_case(char** argv, struct queue_entry* q, u8* use_mem,
                         u32 handicap, u8 from_queue) {

  printf("in calibrate case\n");

  static u8 first_trace[MAP_SIZE];

  u8  fault = 0, new_bits = 0, var_detected = 0,
      first_run = (q->exec_cksum == 0);

  u64 start_us, stop_us;

  s32 old_sc = stage_cur, old_sm = stage_max;
  u32 use_tmout = exec_tmout;
  u8* old_sn = stage_name;

  /* Be a bit more generous about timeouts when resuming sessions, or when
     trying to calibrate already-added finds. This helps avoid trouble due
     to intermittent latency. */

  if (!from_queue || resuming_fuzz)
    use_tmout = MAX(exec_tmout + CAL_TMOUT_ADD,
                    exec_tmout * CAL_TMOUT_PERC / 100);

  q->cal_failed++;

  stage_name = "calibration";
  stage_max  = fast_cal ? 3 : CAL_CYCLES;

  /* Make sure the forkserver is up before we do anything, and let's not
     count its spin-up time toward binary calibration. */
  // initiate the specific forkserver or all of them? TODO
  if( !forksrv_pid[0] ){
  	//TODO _> init all forkservers
  	//init_forkserver(argv);
  	FATAL("Forkservers aren't up!");
  	//init_all_forkservers(argv);
  }

  if (q->exec_cksum) memcpy(first_trace, trace_bits, MAP_SIZE);

  start_us = get_cur_time_us();

  for (stage_cur = 0; stage_cur < stage_max; stage_cur++) {

    u32 cksum;

    if (!first_run && !(stage_cur % stats_update_freq)) show_stats();

    write_to_testcase(use_mem, q->len); // its fine

    //fault = run_target(argv, use_tmout); // TODO -> change this

    // TODO -> need to pass through every program here?
    //		Or do we just want to pass the one being tested? and then change it over time?

    // TODO -> change this so we have a circle array
    //		-> keep changing the program under test under a specified condition
    //	    -> probably the changing act will not be here but someplace else
    int hit;
    run_forkserver_on_target(use_tmout, &hit, fsrv_ctl_fd[0], fsrv_st_fd[0], &fault);

    printf("\tfault = %d\n", fault);

    /* stop_soon is set by the handler for Ctrl+C. When it's pressed,
       we want to bail out quickly. */

    if (stop_soon || fault != crash_mode) goto abort_calibration;

    printf("\tdid not go to abort_calibration\n");

    if (!dumb_mode && !stage_cur && !count_bytes(trace_bits)) {
      fault = FAULT_NOINST;
      goto abort_calibration;
    }

    cksum = hash32(trace_bits, MAP_SIZE, HASH_CONST);

    if (q->exec_cksum != cksum) {

      u8 hnb = has_new_bits(virgin_bits);
      if (hnb > new_bits) new_bits = hnb;

      if (q->exec_cksum) {

        u32 i;

        for (i = 0; i < MAP_SIZE; i++) {

          if (!var_bytes[i] && first_trace[i] != trace_bits[i]) {

            var_bytes[i] = 1;
            stage_max    = CAL_CYCLES_LONG;

          }

        }

        var_detected = 1;

      } else {

        q->exec_cksum = cksum;
        memcpy(first_trace, trace_bits, MAP_SIZE);

      }

    }

  }

  stop_us = get_cur_time_us();

  total_cal_us     += stop_us - start_us;
  total_cal_cycles += stage_max;

  /* OK, let's collect some stats about the performance of this test case.
     This is used for fuzzing air time calculations in calculate_score(). */

  q->exec_us     = (stop_us - start_us) / stage_max;
  q->bitmap_size = count_bytes(trace_bits);
  q->handicap    = handicap;
  q->cal_failed  = 0;

  total_bitmap_size += q->bitmap_size;
  total_bitmap_entries++;

  update_bitmap_score(q);

  /* If this case didn't result in new output from the instrumentation, tell
     parent. This is a non-critical problem, but something to warn the user
     about. */

  if (!dumb_mode && first_run && !fault && !new_bits) fault = FAULT_NOBITS;

abort_calibration:

  if (new_bits == 2 && !q->has_new_cov) {
    q->has_new_cov = 1;
    queued_with_cov++;
  }

  /* Mark variable paths. */

  if (var_detected) {

    var_byte_count = count_bytes(var_bytes);

    if (!q->var_behavior) {
      mark_as_variable(q);
      queued_variable++;
    }

  }

  stage_name = old_sn;
  stage_cur  = old_sc;
  stage_max  = old_sm;

  if (!first_run) show_stats();

  return fault;

}


/* Examine map coverage. Called once, for first test case. */

	static void check_map_coverage(void) {

		u32 i;

		if (count_bytes(trace_bits) < 100) return;

		for (i = (1 << (MAP_SIZE_POW2 - 1)); i < MAP_SIZE; i++)
			if (trace_bits[i]) return;

		WARNF("Recompile binary with newer version of afl to improve coverage!");

	}



/* Helper function: link() if possible, copy otherwise. */

	static void link_or_copy(u8* old_path, u8* new_path) {

		s32 i = link(old_path, new_path);
		s32 sfd, dfd;
		u8* tmp;

		if (!i) return;

		sfd = open(old_path, O_RDONLY);
		if (sfd < 0) PFATAL("Unable to open '%s'", old_path);

		dfd = open(new_path, O_WRONLY | O_CREAT | O_EXCL, 0600);
		if (dfd < 0) PFATAL("Unable to create '%s'", new_path);

		tmp = ck_alloc(64 * 1024);

		while ((i = read(sfd, tmp, 64 * 1024)) > 0) 
			ck_write(dfd, tmp, i, new_path);

		if (i < 0) PFATAL("read() failed");

		ck_free(tmp);
		close(sfd);
		close(dfd);

	}


	static void nuke_resume_dir(void);

/* Create hard links for input test cases in the output directory, choosing
   good names and pivoting accordingly. */

	static void pivot_inputs(void) {

		struct queue_entry* q = queue;
		u32 id = 0;

		ACTF("Creating hard links for all input files...");

		while (q) {

			u8  *nfn, *rsl = strrchr(q->fname, '/');
			u32 orig_id;

			if (!rsl) rsl = q->fname; else rsl++;

    /* If the original file name conforms to the syntax and the recorded
       ID matches the one we'd assign, just use the original file name.
       This is valuable for resuming fuzzing runs. */

#ifndef SIMPLE_FILES
#  define CASE_PREFIX "id:"
#else
#  define CASE_PREFIX "id_"
#endif /* ^!SIMPLE_FILES */

			if (!strncmp(rsl, CASE_PREFIX, 3) &&
				sscanf(rsl + 3, "%06u", &orig_id) == 1 && orig_id == id) {

				u8* src_str;
			u32 src_id;

			resuming_fuzz = 1;
			nfn = alloc_printf("%s/queue/%s", out_dir, rsl);

      /* Since we're at it, let's also try to find parent and figure out the
         appropriate depth for this entry. */

			src_str = strchr(rsl + 3, ':');

			if (src_str && sscanf(src_str + 1, "%06u", &src_id) == 1) {

				struct queue_entry* s = queue;
				while (src_id-- && s) s = s->next;
				if (s) q->depth = s->depth + 1;

				if (max_depth < q->depth) max_depth = q->depth;

			}

		} else {

      /* No dice - invent a new name, capturing the original one as a
         substring. */

#ifndef SIMPLE_FILES

			u8* use_name = strstr(rsl, ",orig:");

			if (use_name) use_name += 6; else use_name = rsl;
			nfn = alloc_printf("%s/queue/id:%06u,orig:%s", out_dir, id, use_name);

#else

			nfn = alloc_printf("%s/queue/id_%06u", out_dir, id);

#endif /* ^!SIMPLE_FILES */

		}

    /* Pivot to the new queue entry. */

		link_or_copy(q->fname, nfn);
		ck_free(q->fname);
		q->fname = nfn;

    /* Make sure that the passed_det value carries over, too. */

		if (q->passed_det) mark_as_det_done(q);

		q = q->next;
		id++;

	}

	if (in_place_resume) nuke_resume_dir();

}



/* Check if the result of an execve() during routine fuzzing is interesting,
   save or queue the input test case for further analysis if so. Returns 1 if
   entry is saved, 0 otherwise. */

static u8 save_if_interesting(char** argv, void* mem, u32 len, u8 fault) {

  u8  *fn = "";
  u8  hnb;
  s32 fd;
  u8  keeping = 0, res;

  if (fault == crash_mode) {

    /* Keep only if there are new bits in the map, add to queue for
       future fuzzing, etc. */

    if (!(hnb = has_new_bits(virgin_bits))) {
      if (crash_mode) total_crashes++;
      return 0;
    }    

#ifndef SIMPLE_FILES

    fn = alloc_printf("%s/queue/id:%06u,%s", out_dir, queued_paths,
                      describe_op(hnb));

#else

    fn = alloc_printf("%s/queue/id_%06u", out_dir, queued_paths);

#endif /* ^!SIMPLE_FILES */

    add_to_queue(fn, len, 0);

    if (hnb == 2) {
      queue_top->has_new_cov = 1;
      queued_with_cov++;
    }

    queue_top->exec_cksum = hash32(trace_bits, MAP_SIZE, HASH_CONST);

    /* Try to calibrate inline; this also calls update_bitmap_score() when
       successful. */

    res = calibrate_case(argv, queue_top, mem, queue_cycle - 1, 0);

    if (res == FAULT_ERROR)
      FATAL("Unable to execute target application");

    fd = open(fn, O_WRONLY | O_CREAT | O_EXCL, 0600);
    if (fd < 0) PFATAL("Unable to create '%s'", fn);
    ck_write(fd, mem, len, fn);
    close(fd);

    keeping = 1;

  }

  switch (fault) {

    case FAULT_TMOUT:

      /* Timeouts are not very interesting, but we're still obliged to keep
         a handful of samples. We use the presence of new bits in the
         hang-specific bitmap as a signal of uniqueness. In "dumb" mode, we
         just keep everything. */

      total_tmouts++;

      if (unique_hangs >= KEEP_UNIQUE_HANG) return keeping;

      if (!dumb_mode) {

#ifdef __x86_64__
        simplify_trace((u64*)trace_bits);
#else
        simplify_trace((u32*)trace_bits);
#endif /* ^__x86_64__ */

        if (!has_new_bits(virgin_tmout)) return keeping;

      }

      unique_tmouts++;

      /* Before saving, we make sure that it's a genuine hang by re-running
         the target with a more generous timeout (unless the default timeout
         is already generous). */

      if (exec_tmout < hang_tmout) {

        u8 new_fault;
        write_to_testcase(mem, len);
        new_fault = run_target(argv, hang_tmout);

        /* A corner case that one user reported bumping into: increasing the
           timeout actually uncovers a crash. Make sure we don't discard it if
           so. */

        if (!stop_soon && new_fault == FAULT_CRASH) goto keep_as_crash;

        if (stop_soon || new_fault != FAULT_TMOUT) return keeping;

      }

#ifndef SIMPLE_FILES

      fn = alloc_printf("%s/hangs/id:%06llu,%s", out_dir,
                        unique_hangs, describe_op(0));

#else

      fn = alloc_printf("%s/hangs/id_%06llu", out_dir,
                        unique_hangs);

#endif /* ^!SIMPLE_FILES */

      unique_hangs++;

      last_hang_time = get_cur_time();

      break;

    case FAULT_CRASH:

keep_as_crash:

      /* This is handled in a manner roughly similar to timeouts,
         except for slightly different limits and no need to re-run test
         cases. */

      total_crashes++;

      if (unique_crashes >= KEEP_UNIQUE_CRASH) return keeping;

      if (!dumb_mode) {

#ifdef __x86_64__
        simplify_trace((u64*)trace_bits);
#else
        simplify_trace((u32*)trace_bits);
#endif /* ^__x86_64__ */

        if (!has_new_bits(virgin_crash)) return keeping;

      }

      if (!unique_crashes) write_crash_readme();

#ifndef SIMPLE_FILES

      fn = alloc_printf("%s/crashes/id:%06llu,sig:%02u,%s", out_dir,
                        unique_crashes, kill_signal, describe_op(0));

#else

      fn = alloc_printf("%s/crashes/id_%06llu_%02u", out_dir, unique_crashes,
                        kill_signal);

#endif /* ^!SIMPLE_FILES */

      unique_crashes++;

      last_crash_time = get_cur_time();
      last_crash_execs = total_execs;

      break;

    case FAULT_ERROR: FATAL("Unable to execute target application");

    default: return keeping;

  }

  /* If we're here, we apparently want to save the crash or hang
     test case, too. */

  fd = open(fn, O_WRONLY | O_CREAT | O_EXCL, 0600);
  if (fd < 0) PFATAL("Unable to create '%s'", fn);
  ck_write(fd, mem, len, fn);
  close(fd);

  ck_free(fn);

  return keeping;

}

/* When resuming, try to find the queue position to start from. This makes sense
   only when resuming, and when we can find the original fuzzer_stats. */

static u32 find_start_position(void) {

  static u8 tmp[4096]; /* Ought to be enough for anybody. */

  u8  *fn, *off;
  s32 fd, i;
  u32 ret;

  if (!resuming_fuzz) return 0;

  if (in_place_resume) fn = alloc_printf("%s/fuzzer_stats", out_dir);
  else fn = alloc_printf("%s/../fuzzer_stats", in_dir);

  fd = open(fn, O_RDONLY);
  ck_free(fn);

  if (fd < 0) return 0;

  i = read(fd, tmp, sizeof(tmp) - 1); (void)i; /* Ignore errors */
  close(fd);

  off = strstr(tmp, "cur_path          : ");
  if (!off) return 0;

  ret = atoi(off + 20);
  if (ret >= queued_paths) ret = 0;
  return ret;

}

/* The same, but for timeouts. The idea is that when resuming sessions without
   -t given, we don't want to keep auto-scaling the timeout over and over
   again to prevent it from growing due to random flukes. */

static void find_timeout(void) {

  static u8 tmp[4096]; /* Ought to be enough for anybody. */

	u8  *fn, *off;
	s32 fd, i;
	u32 ret;

	if (!resuming_fuzz) return;

	if (in_place_resume) fn = alloc_printf("%s/fuzzer_stats", out_dir);
	else fn = alloc_printf("%s/../fuzzer_stats", in_dir);

	fd = open(fn, O_RDONLY);
	ck_free(fn);

	if (fd < 0) return;

  i = read(fd, tmp, sizeof(tmp) - 1); (void)i; /* Ignore errors */
	close(fd);

	off = strstr(tmp, "exec_timeout   : ");
	if (!off) return;

	ret = atoi(off + 17);
	if (ret <= 4) return;

	exec_tmout = ret;
	timeout_given = 3;

}


/* Update stats file for unattended monitoring. */

static void write_stats_file(double bitmap_cvg, double stability, double eps) {

	static double last_bcvg, last_stab, last_eps;

	u8* fn = alloc_printf("%s/fuzzer_stats", out_dir);
	s32 fd;
	FILE* f;

	fd = open(fn, O_WRONLY | O_CREAT | O_TRUNC, 0600);

	if (fd < 0) PFATAL("Unable to create '%s'", fn);

	ck_free(fn);

	f = fdopen(fd, "w");

	if (!f) PFATAL("fdopen() failed");

  /* Keep last values in case we're called from another context
     where exec/sec stats and such are not readily available. */

	if (!bitmap_cvg && !stability && !eps) {
		bitmap_cvg = last_bcvg;
		stability  = last_stab;
		eps        = last_eps;
	} else {
		last_bcvg = bitmap_cvg;
		last_stab = stability;
		last_eps  = eps;
	}

	fprintf(f, "start_time        : %llu\n"
		"last_update       : %llu\n"
		"fuzzer_pid        : %u\n"
		"cycles_done       : %llu\n"
		"execs_done        : %llu\n"
		"execs_per_sec     : %0.02f\n"
		"paths_total       : %u\n"
		"paths_favored     : %u\n"
		"paths_found       : %u\n"
		"paths_imported    : %u\n"
		"max_depth         : %u\n"
             "cur_path          : %u\n" /* Must match find_start_position() */
		"pending_favs      : %u\n"
		"pending_total     : %u\n"
		"variable_paths    : %u\n"
		"stability         : %0.02f%%\n"
		"bitmap_cvg        : %0.02f%%\n"
		"unique_crashes    : %llu\n"
		"unique_hangs      : %llu\n"
		"last_path         : %llu\n"
		"last_crash        : %llu\n"
		"last_hang         : %llu\n"
		"execs_since_crash : %llu\n"
		"exec_timeout      : %u\n"
		"afl_banner        : %s\n"
		"afl_version       : " VERSION "\n"
		"target_mode       : %s%s%s%s%s%s%s\n"
		"command_line      : %s\n",
		start_time / 1000, get_cur_time() / 1000, getpid(),
		queue_cycle ? (queue_cycle - 1) : 0, total_execs, eps,
		queued_paths, queued_favored, queued_discovered, queued_imported,
		max_depth, current_entry, pending_favored, pending_not_fuzzed,
		queued_variable, stability, bitmap_cvg, unique_crashes,
		unique_hangs, last_path_time / 1000, last_crash_time / 1000,
		last_hang_time / 1000, total_execs - last_crash_execs,
		exec_tmout, use_banner,
		qemu_mode ? "qemu " : "", dumb_mode ? " dumb " : "",
		no_forkserver ? "no_forksrv " : "", crash_mode ? "crash " : "",
		persistent_mode ? "persistent " : "", deferred_mode ? "deferred " : "",
		(qemu_mode || dumb_mode || no_forkserver || crash_mode ||
			persistent_mode || deferred_mode) ? "" : "default",
		orig_cmdline);
             /* ignore errors */

	fclose(f);

}


/* Update the plot file if there is a reason to. */

static void maybe_update_plot_file(double bitmap_cvg, double eps) {

	static u32 prev_qp, prev_pf, prev_pnf, prev_ce, prev_md;
	static u64 prev_qc, prev_uc, prev_uh;

	if (prev_qp == queued_paths && prev_pf == pending_favored && 
		prev_pnf == pending_not_fuzzed && prev_ce == current_entry &&
		prev_qc == queue_cycle && prev_uc == unique_crashes &&
		prev_uh == unique_hangs && prev_md == max_depth) return;

		prev_qp  = queued_paths;
	prev_pf  = pending_favored;
	prev_pnf = pending_not_fuzzed;
	prev_ce  = current_entry;
	prev_qc  = queue_cycle;
	prev_uc  = unique_crashes;
	prev_uh  = unique_hangs;
	prev_md  = max_depth;

  /* Fields in the file:

     unix_time, cycles_done, cur_path, paths_total, paths_not_fuzzed,
     favored_not_fuzzed, unique_crashes, unique_hangs, max_depth,
     execs_per_sec */

	fprintf(plot_file, 
		"%llu, %llu, %u, %u, %u, %u, %0.02f%%, %llu, %llu, %u, %0.02f\n",
		get_cur_time() / 1000, queue_cycle - 1, current_entry, queued_paths,
		pending_not_fuzzed, pending_favored, bitmap_cvg, unique_crashes,
          unique_hangs, max_depth, eps); /* ignore errors */

		fflush(plot_file);

	}



/* A helper function for maybe_delete_out_dir(), deleting all prefixed
   files in a directory. */

	static u8 delete_files(u8* path, u8* prefix) {

		DIR* d;
		struct dirent* d_ent;

		d = opendir(path);

		if (!d) return 0;

		while ((d_ent = readdir(d))) {

			if (d_ent->d_name[0] != '.' && (!prefix ||
				!strncmp(d_ent->d_name, prefix, strlen(prefix)))) {

				u8* fname = alloc_printf("%s/%s", path, d_ent->d_name);
			if (unlink(fname)) PFATAL("Unable to delete '%s'", fname);
			ck_free(fname);

		}

	}

	closedir(d);

	return !!rmdir(path);

}


/* Get the number of runnable processes, with some simple smoothing. */

static double get_runnable_processes(void) {

	static double res;

#if defined(__APPLE__) || defined(__FreeBSD__) || defined (__OpenBSD__)

  /* I don't see any portable sysctl or so that would quickly give us the
     number of runnable processes; the 1-minute load average can be a
     semi-decent approximation, though. */

	if (getloadavg(&res, 1) != 1) return 0;

#else

  /* On Linux, /proc/stat is probably the best way; load averages are
     computed in funny ways and sometimes don't reflect extremely short-lived
     processes well. */

	FILE* f = fopen("/proc/stat", "r");
	u8 tmp[1024];
	u32 val = 0;

	if (!f) return 0;

	while (fgets(tmp, sizeof(tmp), f)) {

		if (!strncmp(tmp, "procs_running ", 14) ||
			!strncmp(tmp, "procs_blocked ", 14)) val += atoi(tmp + 14);

	}

fclose(f);

if (!res) {

	res = val;

} else {

	res = res * (1.0 - 1.0 / AVG_SMOOTHING) +
	((double)val) * (1.0 / AVG_SMOOTHING);

}

#endif /* ^(__APPLE__ || __FreeBSD__ || __OpenBSD__) */

return res;

}


/* Delete the temporary directory used for in-place session resume. */

static void nuke_resume_dir(void) {

	u8* fn;

	fn = alloc_printf("%s/_resume/.state/deterministic_done", out_dir);
	if (delete_files(fn, CASE_PREFIX)) goto dir_cleanup_failed;
	ck_free(fn);

	fn = alloc_printf("%s/_resume/.state/auto_extras", out_dir);
	if (delete_files(fn, "auto_")) goto dir_cleanup_failed;
	ck_free(fn);

	fn = alloc_printf("%s/_resume/.state/redundant_edges", out_dir);
	if (delete_files(fn, CASE_PREFIX)) goto dir_cleanup_failed;
	ck_free(fn);

	fn = alloc_printf("%s/_resume/.state/variable_behavior", out_dir);
	if (delete_files(fn, CASE_PREFIX)) goto dir_cleanup_failed;
	ck_free(fn);

	fn = alloc_printf("%s/_resume/.state", out_dir);
	if (rmdir(fn) && errno != ENOENT) goto dir_cleanup_failed;
	ck_free(fn);

	fn = alloc_printf("%s/_resume", out_dir);
	if (delete_files(fn, CASE_PREFIX)) goto dir_cleanup_failed;
	ck_free(fn);

	return;

	dir_cleanup_failed:

	FATAL("_resume directory cleanup failed");

}


/* Delete fuzzer output directory if we recognize it as ours, if the fuzzer
   is not currently running, and if the last run time isn't too great. */

static void maybe_delete_out_dir(void) {

	FILE* f;
	u8 *fn = alloc_printf("%s/fuzzer_stats", out_dir);

  /* See if the output directory is locked. If yes, bail out. If not,
     create a lock that will persist for the lifetime of the process
     (this requires leaving the descriptor open).*/

	out_dir_fd = open(out_dir, O_RDONLY);
	if (out_dir_fd < 0) PFATAL("Unable to open '%s'", out_dir);

#ifndef __sun

	if (flock(out_dir_fd, LOCK_EX | LOCK_NB) && errno == EWOULDBLOCK) {

		SAYF("\n" cLRD "[-] " cRST
			"Looks like the job output directory is being actively used by another\n"
			"    instance of afl-fuzz. You will need to choose a different %s\n"
			"    or stop the other process first.\n",
			sync_id ? "fuzzer ID" : "output location");

		FATAL("Directory '%s' is in use", out_dir);

	}

#endif /* !__sun */

	f = fopen(fn, "r");

	if (f) {

		u64 start_time, last_update;

		if (fscanf(f, "start_time     : %llu\n"
			"last_update    : %llu\n", &start_time, &last_update) != 2)
			FATAL("Malformed data in '%s'", fn);

		fclose(f);

    /* Let's see how much work is at stake. */

		if (!in_place_resume && last_update - start_time > OUTPUT_GRACE * 60) {

			SAYF("\n" cLRD "[-] " cRST
				"The job output directory already exists and contains the results of more\n"
				"    than %u minutes worth of fuzzing. To avoid data loss, afl-fuzz will *NOT*\n"
				"    automatically delete this data for you.\n\n"

				"    If you wish to start a new session, remove or rename the directory manually,\n"
				"    or specify a different output location for this job. To resume the old\n"
				"    session, put '-' as the input directory in the command line ('-i -') and\n"
				"    try again.\n", OUTPUT_GRACE);

			FATAL("At-risk data found in '%s'", out_dir);

		}

	}

	ck_free(fn);

  /* The idea for in-place resume is pretty simple: we temporarily move the old
     queue/ to a new location that gets deleted once import to the new queue/
     is finished. If _resume/ already exists, the current queue/ may be
     incomplete due to an earlier abort, so we want to use the old _resume/
     dir instead, and we let rename() fail silently. */

	if (in_place_resume) {

		u8* orig_q = alloc_printf("%s/queue", out_dir);

		in_dir = alloc_printf("%s/_resume", out_dir);

    rename(orig_q, in_dir); /* Ignore errors */

		OKF("Output directory exists, will attempt session resume.");

		ck_free(orig_q);

	} else {

		OKF("Output directory exists but deemed OK to reuse.");

	}

	ACTF("Deleting old session data...");

  /* Okay, let's get the ball rolling! First, we need to get rid of the entries
     in <out_dir>/.synced/.../id:*, if any are present. */

	if (!in_place_resume) {

		fn = alloc_printf("%s/.synced", out_dir);
		if (delete_files(fn, NULL)) goto dir_cleanup_failed;
		ck_free(fn);

	}

  /* Next, we need to clean up <out_dir>/queue/.state/ subdirectories: */

	fn = alloc_printf("%s/queue/.state/deterministic_done", out_dir);
	if (delete_files(fn, CASE_PREFIX)) goto dir_cleanup_failed;
	ck_free(fn);

	fn = alloc_printf("%s/queue/.state/auto_extras", out_dir);
	if (delete_files(fn, "auto_")) goto dir_cleanup_failed;
	ck_free(fn);

	fn = alloc_printf("%s/queue/.state/redundant_edges", out_dir);
	if (delete_files(fn, CASE_PREFIX)) goto dir_cleanup_failed;
	ck_free(fn);

	fn = alloc_printf("%s/queue/.state/variable_behavior", out_dir);
	if (delete_files(fn, CASE_PREFIX)) goto dir_cleanup_failed;
	ck_free(fn);

  /* Then, get rid of the .state subdirectory itself (should be empty by now)
     and everything matching <out_dir>/queue/id:*. */

	fn = alloc_printf("%s/queue/.state", out_dir);
	if (rmdir(fn) && errno != ENOENT) goto dir_cleanup_failed;
	ck_free(fn);

	fn = alloc_printf("%s/queue", out_dir);
	if (delete_files(fn, CASE_PREFIX)) goto dir_cleanup_failed;
	ck_free(fn);

  /* All right, let's do <out_dir>/crashes/id:* and <out_dir>/hangs/id:*. */

	if (!in_place_resume) {

		fn = alloc_printf("%s/crashes/README.txt", out_dir);
    unlink(fn); /* Ignore errors */
		ck_free(fn);

	}

	fn = alloc_printf("%s/crashes", out_dir);

  /* Make backup of the crashes directory if it's not empty and if we're
     doing in-place resume. */

	if (in_place_resume && rmdir(fn)) {

		time_t cur_t = time(0);
		struct tm* t = localtime(&cur_t);

#ifndef SIMPLE_FILES

		u8* nfn = alloc_printf("%s.%04u-%02u-%02u-%02u:%02u:%02u", fn,
			t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
			t->tm_hour, t->tm_min, t->tm_sec);

#else

		u8* nfn = alloc_printf("%s_%04u%02u%02u%02u%02u%02u", fn,
			t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
			t->tm_hour, t->tm_min, t->tm_sec);

#endif /* ^!SIMPLE_FILES */

    rename(fn, nfn); /* Ignore errors. */
		ck_free(nfn);

	}

	if (delete_files(fn, CASE_PREFIX)) goto dir_cleanup_failed;
	ck_free(fn);

	fn = alloc_printf("%s/hangs", out_dir);

  /* Backup hangs, too. */

	if (in_place_resume && rmdir(fn)) {

		time_t cur_t = time(0);
		struct tm* t = localtime(&cur_t);

#ifndef SIMPLE_FILES

		u8* nfn = alloc_printf("%s.%04u-%02u-%02u-%02u:%02u:%02u", fn,
			t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
			t->tm_hour, t->tm_min, t->tm_sec);

#else

		u8* nfn = alloc_printf("%s_%04u%02u%02u%02u%02u%02u", fn,
			t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
			t->tm_hour, t->tm_min, t->tm_sec);

#endif /* ^!SIMPLE_FILES */

    rename(fn, nfn); /* Ignore errors. */
		ck_free(nfn);

	}

	if (delete_files(fn, CASE_PREFIX)) goto dir_cleanup_failed;
	ck_free(fn);

  /* And now, for some finishing touches. */

	fn = alloc_printf("%s/.cur_input", out_dir);
	if (unlink(fn) && errno != ENOENT) goto dir_cleanup_failed;
	ck_free(fn);

	fn = alloc_printf("%s/fuzz_bitmap", out_dir);
	if (unlink(fn) && errno != ENOENT) goto dir_cleanup_failed;
	ck_free(fn);

	if (!in_place_resume) {
		fn  = alloc_printf("%s/fuzzer_stats", out_dir);
		if (unlink(fn) && errno != ENOENT) goto dir_cleanup_failed;
		ck_free(fn);
	}

	fn = alloc_printf("%s/plot_data", out_dir);
	if (unlink(fn) && errno != ENOENT) goto dir_cleanup_failed;
	ck_free(fn);

	OKF("Output dir cleanup successful.");

  /* Wow... is that all? If yes, celebrate! */

	return;

	dir_cleanup_failed:

	SAYF("\n" cLRD "[-] " cRST
		"Whoops, the fuzzer tried to reuse your output directory, but bumped into\n"
		"    some files that shouldn't be there or that couldn't be removed - so it\n"
		"    decided to abort! This happened while processing this path:\n\n"

		"    %s\n\n"
		"    Please examine and manually delete the files, or specify a different\n"
		"    output location for the tool.\n", fn);

	FATAL("Output directory cleanup failed");

}


/* Perform dry run of all test cases to confirm that the app is working as
   expected. This is done only for the initial inputs, and only once. */

static void perform_dry_run(char** argv) {

  printf("In perform_dry_run\n");

  struct queue_entry* q = queue;
  u32 cal_failures = 0;
  u8* skip_crashes = getenv("AFL_SKIP_CRASHES");

  while (q) {

  	printf("In while queue with file -> %s\n", q->fname);

    u8* use_mem;
    u8  res;
    s32 fd;

    u8* fn = strrchr(q->fname, '/') + 1;

    ACTF("Attempting dry run with '%s'...", fn);

    fd = open(q->fname, O_RDONLY);
    if (fd < 0) PFATAL("Unable to open '%s'", q->fname);

    use_mem = ck_alloc_nozero(q->len);

    if (read(fd, use_mem, q->len) != q->len)
      FATAL("Short read from '%s'", q->fname);

    close(fd);

   	res = calibrate_case(argv, q, use_mem, 0, 1); // TODO
   	//res = FAULT_TMOUT;
    ck_free(use_mem);

    if (stop_soon) return;

    if (res == crash_mode || res == FAULT_NOBITS)
      SAYF(cGRA "    len = %u, map size = %u, exec speed = %llu us\n" cRST, 
           q->len, q->bitmap_size, q->exec_us);

  	switch (res) {

      case FAULT_NONE:

        if (q == queue) check_map_coverage();

        if (crash_mode) FATAL("Test case '%s' does *NOT* crash", fn);

        break;

      case FAULT_TMOUT:

        if (timeout_given) {

          /* The -t nn+ syntax in the command line sets timeout_given to '2' and
             instructs afl-fuzz to tolerate but skip queue entries that time
             out. */

          if (timeout_given > 1) {
            WARNF("Test case results in a timeout (skipping)");
            q->cal_failed = CAL_CHANCES;
            cal_failures++;
            break;
          }

          SAYF("\n" cLRD "[-] " cRST
               "The program took more than %u ms to process one of the initial test cases.\n"
               "    Usually, the right thing to do is to relax the -t option - or to delete it\n"
               "    altogether and allow the fuzzer to auto-calibrate. That said, if you know\n"
               "    what you are doing and want to simply skip the unruly test cases, append\n"
               "    '+' at the end of the value passed to -t ('-t %u+').\n", exec_tmout,
               exec_tmout);

          FATAL("Test case '%s' results in a timeout", fn);

        } else {

          SAYF("\n" cLRD "[-] " cRST
               "The program took more than %u ms to process one of the initial test cases.\n"
               "    This is bad news; raising the limit with the -t option is possible, but\n"
               "    will probably make the fuzzing process extremely slow.\n\n"

               "    If this test case is just a fluke, the other option is to just avoid it\n"
               "    altogether, and find one that is less of a CPU hog.\n", exec_tmout);

          FATAL("Test case '%s' results in a timeout", fn);

        }

      case FAULT_CRASH:  

        if (crash_mode) break;

        if (skip_crashes) {
          WARNF("Test case results in a crash (skipping)");
          q->cal_failed = CAL_CHANCES;
          cal_failures++;
          break;
        }

        if (mem_limit) {

          SAYF("\n" cLRD "[-] " cRST
               "Oops, the program crashed with one of the test cases provided. There are\n"
               "    several possible explanations:\n\n"

               "    - The test case causes known crashes under normal working conditions. If\n"
               "      so, please remove it. The fuzzer should be seeded with interesting\n"
               "      inputs - but not ones that cause an outright crash.\n\n"

               "    - The current memory limit (%s) is too low for this program, causing\n"
               "      it to die due to OOM when parsing valid files. To fix this, try\n"
               "      bumping it up with the -m setting in the command line. If in doubt,\n"
               "      try something along the lines of:\n\n"

#ifdef RLIMIT_AS
               "      ( ulimit -Sv $[%llu << 10]; /path/to/binary [...] <testcase )\n\n"
#else
               "      ( ulimit -Sd $[%llu << 10]; /path/to/binary [...] <testcase )\n\n"
#endif /* ^RLIMIT_AS */

               "      Tip: you can use http://jwilk.net/software/recidivm to quickly\n"
               "      estimate the required amount of virtual memory for the binary. Also,\n"
               "      if you are using ASAN, see %s/notes_for_asan.txt.\n\n"

#ifdef __APPLE__
  
               "    - On MacOS X, the semantics of fork() syscalls are non-standard and may\n"
               "      break afl-fuzz performance optimizations when running platform-specific\n"
               "      binaries. To fix this, set AFL_NO_FORKSRV=1 in the environment.\n\n"

#endif /* __APPLE__ */

               "    - Least likely, there is a horrible bug in the fuzzer. If other options\n"
               "      fail, poke <lcamtuf@coredump.cx> for troubleshooting tips.\n",
               DMS(mem_limit << 20), mem_limit - 1, doc_path);

        } else {

          SAYF("\n" cLRD "[-] " cRST
               "Oops, the program crashed with one of the test cases provided. There are\n"
               "    several possible explanations:\n\n"

               "    - The test case causes known crashes under normal working conditions. If\n"
               "      so, please remove it. The fuzzer should be seeded with interesting\n"
               "      inputs - but not ones that cause an outright crash.\n\n"

#ifdef __APPLE__
  
               "    - On MacOS X, the semantics of fork() syscalls are non-standard and may\n"
               "      break afl-fuzz performance optimizations when running platform-specific\n"
               "      binaries. To fix this, set AFL_NO_FORKSRV=1 in the environment.\n\n"

#endif /* __APPLE__ */

               "    - Least likely, there is a horrible bug in the fuzzer. If other options\n"
               "      fail, poke <lcamtuf@coredump.cx> for troubleshooting tips.\n");

        }

        FATAL("Test case '%s' results in a crash", fn);

      case FAULT_ERROR:

        FATAL("Unable to execute target application ('%s')", argv[0]);

      case FAULT_NOINST:

        FATAL("No instrumentation detected");

      case FAULT_NOBITS: 

        useless_at_start++;

        if (!in_bitmap && !shuffle_queue)
          WARNF("No new instrumentation output, test case may be useless.");

        break;

    }


    if (q->var_behavior) WARNF("Instrumentation output varies across runs.");

    q = q->next;

  }

  if (cal_failures) {

    if (cal_failures == queued_paths)
      FATAL("All test cases time out%s, giving up!",
            skip_crashes ? " or crash" : "");

    WARNF("Skipped %u test cases (%0.02f%%) due to timeouts%s.", cal_failures,
          ((double)cal_failures) * 100 / queued_paths,
          skip_crashes ? " or crashes" : "");

    if (cal_failures * 5 > queued_paths)
      WARNF(cLRD "High percentage of rejected test cases, check settings!");

  }

  OKF("All test cases processed.");

}


static void check_term_size(void);


/* A spiffy retro stats screen! This is called every stats_update_freq
   execve() calls, plus in several other circumstances. */

static void show_stats(void) {

	static u64 last_stats_ms, last_plot_ms, last_ms, last_execs;
	static double avg_exec;
	double t_byte_ratio, stab_ratio;

	u64 cur_ms;
	u32 t_bytes, t_bits;

	u32 banner_len, banner_pad;
	u8  tmp[256];

	cur_ms = get_cur_time();

  /* If not enough time has passed since last UI update, bail out. */

	if (cur_ms - last_ms < 1000 / UI_TARGET_HZ) return;

  /* Check if we're past the 10 minute mark. */

	if (cur_ms - start_time > 10 * 60 * 1000) run_over10m = 1;

  /* Calculate smoothed exec speed stats. */

	if (!last_execs) {

		avg_exec = ((double)total_execs) * 1000 / (cur_ms - start_time);

	} else {

		double cur_avg = ((double)(total_execs - last_execs)) * 1000 /
		(cur_ms - last_ms);

    /* If there is a dramatic (5x+) jump in speed, reset the indicator
       more quickly. */

		if (cur_avg * 5 < avg_exec || cur_avg / 5 > avg_exec)
			avg_exec = cur_avg;

		avg_exec = avg_exec * (1.0 - 1.0 / AVG_SMOOTHING) +
		cur_avg * (1.0 / AVG_SMOOTHING);

	}

	last_ms = cur_ms;
	last_execs = total_execs;

  /* Tell the callers when to contact us (as measured in execs). */

	stats_update_freq = avg_exec / (UI_TARGET_HZ * 10);
	if (!stats_update_freq) stats_update_freq = 1;

  /* Do some bitmap stats. */

	t_bytes = count_non_255_bytes(virgin_bits);
	t_byte_ratio = ((double)t_bytes * 100) / MAP_SIZE;

	if (t_bytes) 
		stab_ratio = 100 - ((double)var_byte_count) * 100 / t_bytes;
	else
		stab_ratio = 100;

  /* Roughly every minute, update fuzzer stats and save auto tokens. */

	if (cur_ms - last_stats_ms > STATS_UPDATE_SEC * 1000) {

		last_stats_ms = cur_ms;
		write_stats_file(t_byte_ratio, stab_ratio, avg_exec);
		save_auto();
		write_bitmap();

	}

  /* Every now and then, write plot data. */

	if (cur_ms - last_plot_ms > PLOT_UPDATE_SEC * 1000) {

		last_plot_ms = cur_ms;
		maybe_update_plot_file(t_byte_ratio, avg_exec);

	}

  /* Honor AFL_EXIT_WHEN_DONE and AFL_BENCH_UNTIL_CRASH. */

	if (!dumb_mode && cycles_wo_finds > 100 && !pending_not_fuzzed &&
		getenv("AFL_EXIT_WHEN_DONE")) stop_soon = 2;

		if (total_crashes && getenv("AFL_BENCH_UNTIL_CRASH")) stop_soon = 2;

  /* If we're not on TTY, bail out. */

	if (not_on_tty) return;

  /* Compute some mildly useful bitmap stats. */

	t_bits = (MAP_SIZE << 3) - count_bits(virgin_bits);

  /* Now, for the visuals... */

	if (clear_screen) {

		SAYF(TERM_CLEAR CURSOR_HIDE);
		clear_screen = 0;

		check_term_size();

	}

	SAYF(TERM_HOME);

	if (term_too_small) {

		SAYF(cBRI "Your terminal is too small to display the UI.\n"
			"Please resize terminal window to at least 80x25.\n" cRST);

		return;

	}

  /* Let's start by drawing a centered banner. */

	banner_len = (crash_mode ? 24 : 22) + strlen(VERSION) + strlen(use_banner);
	banner_pad = (80 - banner_len) / 2;
	memset(tmp, ' ', banner_pad);

	sprintf(tmp + banner_pad, "%s " cLCY VERSION cLGN
		" (%s)",  crash_mode ? cPIN "peruvian were-rabbit" : 
		cYEL "american fuzzy lop", use_banner);

	SAYF("\n%s\n\n", tmp);

  /* "Handy" shortcuts for drawing boxes... */

#define bSTG    bSTART cGRA
#define bH2     bH bH
#define bH5     bH2 bH2 bH
#define bH10    bH5 bH5
#define bH20    bH10 bH10
#define bH30    bH20 bH10
#define SP5     "     "
#define SP10    SP5 SP5
#define SP20    SP10 SP10

  /* Lord, forgive me this. */

	SAYF(SET_G1 bSTG bLT bH bSTOP cCYA " process timing " bSTG bH30 bH5 bH2 bHB
		bH bSTOP cCYA " overall results " bSTG bH5 bRT "\n");

	if (dumb_mode) {

		strcpy(tmp, cRST);

	} else {

		u64 min_wo_finds = (cur_ms - last_path_time) / 1000 / 60;

    /* First queue cycle: don't stop now! */
		if (queue_cycle == 1 || min_wo_finds < 15) strcpy(tmp, cMGN); else

    /* Subsequent cycles, but we're still making finds. */
		if (cycles_wo_finds < 25 || min_wo_finds < 30) strcpy(tmp, cYEL); else

    /* No finds for a long time and no test cases to try. */
		if (cycles_wo_finds > 100 && !pending_not_fuzzed && min_wo_finds > 120)
			strcpy(tmp, cLGN);

    /* Default: cautiously OK to stop? */
		else strcpy(tmp, cLBL);

	}

	SAYF(bV bSTOP "        run time : " cRST "%-34s " bSTG bV bSTOP
		"  cycles done : %s%-5s  " bSTG bV "\n",
		DTD(cur_ms, start_time), tmp, DI(queue_cycle - 1));

  /* We want to warn people about not seeing new paths after a full cycle,
     except when resuming fuzzing or running in non-instrumented mode. */

	if (!dumb_mode && (last_path_time || resuming_fuzz || queue_cycle == 1 ||
		in_bitmap || crash_mode)) {

		SAYF(bV bSTOP "   last new path : " cRST "%-34s ",
			DTD(cur_ms, last_path_time));

} else {

	if (dumb_mode)

		SAYF(bV bSTOP "   last new path : " cPIN "n/a" cRST 
			" (non-instrumented mode)        ");

	else

		SAYF(bV bSTOP "   last new path : " cRST "none yet " cLRD
			"(odd, check syntax!)      ");

}

SAYF(bSTG bV bSTOP "  total paths : " cRST "%-5s  " bSTG bV "\n",
	DI(queued_paths));

  /* Highlight crashes in red if found, denote going over the KEEP_UNIQUE_CRASH
     limit with a '+' appended to the count. */

sprintf(tmp, "%s%s", DI(unique_crashes),
	(unique_crashes >= KEEP_UNIQUE_CRASH) ? "+" : "");

SAYF(bV bSTOP " last uniq crash : " cRST "%-34s " bSTG bV bSTOP
	" uniq crashes : %s%-6s " bSTG bV "\n",
	DTD(cur_ms, last_crash_time), unique_crashes ? cLRD : cRST,
	tmp);

sprintf(tmp, "%s%s", DI(unique_hangs),
	(unique_hangs >= KEEP_UNIQUE_HANG) ? "+" : "");

SAYF(bV bSTOP "  last uniq hang : " cRST "%-34s " bSTG bV bSTOP 
	"   uniq hangs : " cRST "%-6s " bSTG bV "\n",
	DTD(cur_ms, last_hang_time), tmp);

SAYF(bVR bH bSTOP cCYA " cycle progress " bSTG bH20 bHB bH bSTOP cCYA
	" map coverage " bSTG bH bHT bH20 bH2 bH bVL "\n");

  /* This gets funny because we want to print several variable-length variables
     together, but then cram them into a fixed-width field - so we need to
     put them in a temporary buffer first. */

sprintf(tmp, "%s%s (%0.02f%%)", DI(current_entry),
	queue_cur->favored ? "" : "*",
	((double)current_entry * 100) / queued_paths);

SAYF(bV bSTOP "  now processing : " cRST "%-17s " bSTG bV bSTOP, tmp);

sprintf(tmp, "%0.02f%% / %0.02f%%", ((double)queue_cur->bitmap_size) * 
	100 / MAP_SIZE, t_byte_ratio);

SAYF("    map density : %s%-21s " bSTG bV "\n", t_byte_ratio > 70 ? cLRD : 
	((t_bytes < 200 && !dumb_mode) ? cPIN : cRST), tmp);

sprintf(tmp, "%s (%0.02f%%)", DI(cur_skipped_paths),
	((double)cur_skipped_paths * 100) / queued_paths);

SAYF(bV bSTOP " paths timed out : " cRST "%-17s " bSTG bV, tmp);

sprintf(tmp, "%0.02f bits/tuple",
	t_bytes ? (((double)t_bits) / t_bytes) : 0);

SAYF(bSTOP " count coverage : " cRST "%-21s " bSTG bV "\n", tmp);

SAYF(bVR bH bSTOP cCYA " stage progress " bSTG bH20 bX bH bSTOP cCYA
	" findings in depth " bSTG bH20 bVL "\n");

sprintf(tmp, "%s (%0.02f%%)", DI(queued_favored),
	((double)queued_favored) * 100 / queued_paths);

  /* Yeah... it's still going on... halp? */

SAYF(bV bSTOP "  now trying : " cRST "%-21s " bSTG bV bSTOP 
	" favored paths : " cRST "%-22s " bSTG bV "\n", stage_name, tmp);

if (!stage_max) {

	sprintf(tmp, "%s/-", DI(stage_cur));

} else {

	sprintf(tmp, "%s/%s (%0.02f%%)", DI(stage_cur), DI(stage_max),
		((double)stage_cur) * 100 / stage_max);

}

SAYF(bV bSTOP " stage execs : " cRST "%-21s " bSTG bV bSTOP, tmp);

sprintf(tmp, "%s (%0.02f%%)", DI(queued_with_cov),
	((double)queued_with_cov) * 100 / queued_paths);

SAYF("  new edges on : " cRST "%-22s " bSTG bV "\n", tmp);

sprintf(tmp, "%s (%s%s unique)", DI(total_crashes), DI(unique_crashes),
	(unique_crashes >= KEEP_UNIQUE_CRASH) ? "+" : "");

if (crash_mode) {

	SAYF(bV bSTOP " total execs : " cRST "%-21s " bSTG bV bSTOP
		"   new crashes : %s%-22s " bSTG bV "\n", DI(total_execs),
		unique_crashes ? cLRD : cRST, tmp);

} else {

	SAYF(bV bSTOP " total execs : " cRST "%-21s " bSTG bV bSTOP
		" total crashes : %s%-22s " bSTG bV "\n", DI(total_execs),
		unique_crashes ? cLRD : cRST, tmp);

}

  /* Show a warning about slow execution. */

if (avg_exec < 100) {

	sprintf(tmp, "%s/sec (%s)", DF(avg_exec), avg_exec < 20 ?
		"zzzz..." : "slow!");

	SAYF(bV bSTOP "  exec speed : " cLRD "%-21s ", tmp);

} else {

	sprintf(tmp, "%s/sec", DF(avg_exec));
	SAYF(bV bSTOP "  exec speed : " cRST "%-21s ", tmp);

}

sprintf(tmp, "%s (%s%s unique)", DI(total_tmouts), DI(unique_tmouts),
	(unique_hangs >= KEEP_UNIQUE_HANG) ? "+" : "");

SAYF (bSTG bV bSTOP "  total tmouts : " cRST "%-22s " bSTG bV "\n", tmp);

  /* Aaaalmost there... hold on! */

SAYF(bVR bH cCYA bSTOP " fuzzing strategy yields " bSTG bH10 bH bHT bH10
	bH5 bHB bH bSTOP cCYA " path geometry " bSTG bH5 bH2 bH bVL "\n");

if (skip_deterministic) {

	strcpy(tmp, "n/a, n/a, n/a");

} else {

	sprintf(tmp, "%s/%s, %s/%s, %s/%s",
		DI(stage_finds[STAGE_FLIP1]), DI(stage_cycles[STAGE_FLIP1]),
		DI(stage_finds[STAGE_FLIP2]), DI(stage_cycles[STAGE_FLIP2]),
		DI(stage_finds[STAGE_FLIP4]), DI(stage_cycles[STAGE_FLIP4]));

}

SAYF(bV bSTOP "   bit flips : " cRST "%-37s " bSTG bV bSTOP "    levels : "
	cRST "%-10s " bSTG bV "\n", tmp, DI(max_depth));

if (!skip_deterministic)
	sprintf(tmp, "%s/%s, %s/%s, %s/%s",
		DI(stage_finds[STAGE_FLIP8]), DI(stage_cycles[STAGE_FLIP8]),
		DI(stage_finds[STAGE_FLIP16]), DI(stage_cycles[STAGE_FLIP16]),
		DI(stage_finds[STAGE_FLIP32]), DI(stage_cycles[STAGE_FLIP32]));

SAYF(bV bSTOP "  byte flips : " cRST "%-37s " bSTG bV bSTOP "   pending : "
	cRST "%-10s " bSTG bV "\n", tmp, DI(pending_not_fuzzed));

if (!skip_deterministic)
	sprintf(tmp, "%s/%s, %s/%s, %s/%s",
		DI(stage_finds[STAGE_ARITH8]), DI(stage_cycles[STAGE_ARITH8]),
		DI(stage_finds[STAGE_ARITH16]), DI(stage_cycles[STAGE_ARITH16]),
		DI(stage_finds[STAGE_ARITH32]), DI(stage_cycles[STAGE_ARITH32]));

SAYF(bV bSTOP " arithmetics : " cRST "%-37s " bSTG bV bSTOP "  pend fav : "
	cRST "%-10s " bSTG bV "\n", tmp, DI(pending_favored));

if (!skip_deterministic)
	sprintf(tmp, "%s/%s, %s/%s, %s/%s",
		DI(stage_finds[STAGE_INTEREST8]), DI(stage_cycles[STAGE_INTEREST8]),
		DI(stage_finds[STAGE_INTEREST16]), DI(stage_cycles[STAGE_INTEREST16]),
		DI(stage_finds[STAGE_INTEREST32]), DI(stage_cycles[STAGE_INTEREST32]));

SAYF(bV bSTOP "  known ints : " cRST "%-37s " bSTG bV bSTOP " own finds : "
	cRST "%-10s " bSTG bV "\n", tmp, DI(queued_discovered));

if (!skip_deterministic)
	sprintf(tmp, "%s/%s, %s/%s, %s/%s",
		DI(stage_finds[STAGE_EXTRAS_UO]), DI(stage_cycles[STAGE_EXTRAS_UO]),
		DI(stage_finds[STAGE_EXTRAS_UI]), DI(stage_cycles[STAGE_EXTRAS_UI]),
		DI(stage_finds[STAGE_EXTRAS_AO]), DI(stage_cycles[STAGE_EXTRAS_AO]));

SAYF(bV bSTOP "  dictionary : " cRST "%-37s " bSTG bV bSTOP
	"  imported : " cRST "%-10s " bSTG bV "\n", tmp,
	sync_id ? DI(queued_imported) : (u8*)"n/a");

sprintf(tmp, "%s/%s, %s/%s",
	DI(stage_finds[STAGE_HAVOC]), DI(stage_cycles[STAGE_HAVOC]),
	DI(stage_finds[STAGE_SPLICE]), DI(stage_cycles[STAGE_SPLICE]));

SAYF(bV bSTOP "       havoc : " cRST "%-37s " bSTG bV bSTOP, tmp);

if (t_bytes) sprintf(tmp, "%0.02f%%", stab_ratio);
else strcpy(tmp, "n/a");

SAYF(" stability : %s%-10s " bSTG bV "\n", (stab_ratio < 85 && var_byte_count > 40) 
	? cLRD : ((queued_variable && (!persistent_mode || var_byte_count > 20))
		? cMGN : cRST), tmp);

if (!bytes_trim_out) {

	sprintf(tmp, "n/a, ");

} else {

	sprintf(tmp, "%0.02f%%/%s, ",
		((double)(bytes_trim_in - bytes_trim_out)) * 100 / bytes_trim_in,
		DI(trim_execs));

}

if (!blocks_eff_total) {

	u8 tmp2[128];

	sprintf(tmp2, "n/a");
	strcat(tmp, tmp2);

} else {

	u8 tmp2[128];

	sprintf(tmp2, "%0.02f%%",
		((double)(blocks_eff_total - blocks_eff_select)) * 100 /
		blocks_eff_total);

	strcat(tmp, tmp2);

}

SAYF(bV bSTOP "        trim : " cRST "%-37s " bSTG bVR bH20 bH2 bH2 bRB "\n"
	bLB bH30 bH20 bH2 bH bRB bSTOP cRST RESET_G1, tmp);

  /* Provide some CPU utilization stats. */

if (cpu_core_count) {

	double cur_runnable = get_runnable_processes();
	u32 cur_utilization = cur_runnable * 100 / cpu_core_count;

	u8* cpu_color = cCYA;

    /* If we could still run one or more processes, use green. */

	if (cpu_core_count > 1 && cur_runnable + 1 <= cpu_core_count)
		cpu_color = cLGN;

    /* If we're clearly oversubscribed, use red. */

	if (!no_cpu_meter_red && cur_utilization >= 150) cpu_color = cLRD;

#ifdef HAVE_AFFINITY

	if (cpu_aff >= 0) {

		SAYF(SP10 cGRA "[cpu%03u:%s%3u%%" cGRA "]\r" cRST, 
			MIN(cpu_aff, 999), cpu_color,
			MIN(cur_utilization, 999));

	} else {

		SAYF(SP10 cGRA "   [cpu:%s%3u%%" cGRA "]\r" cRST,
			cpu_color, MIN(cur_utilization, 999));

	}

#else

	SAYF(SP10 cGRA "   [cpu:%s%3u%%" cGRA "]\r" cRST,
		cpu_color, MIN(cur_utilization, 999));

#endif /* ^HAVE_AFFINITY */

} else SAYF("\r");

  /* Hallelujah! */

fflush(0);

}


/* Display quick statistics at the end of processing the input directory,
   plus a bunch of warnings. Some calibration stuff also ended up here,
   along with several hardcoded constants. Maybe clean up eventually. */

static void show_init_stats(void) {

	struct queue_entry* q = queue;
	u32 min_bits = 0, max_bits = 0;
	u64 min_us = 0, max_us = 0;
	u64 avg_us = 0;
	u32 max_len = 0;

	if (total_cal_cycles) avg_us = total_cal_us / total_cal_cycles;

	while (q) {

		if (!min_us || q->exec_us < min_us) min_us = q->exec_us;
		if (q->exec_us > max_us) max_us = q->exec_us;

		if (!min_bits || q->bitmap_size < min_bits) min_bits = q->bitmap_size;
		if (q->bitmap_size > max_bits) max_bits = q->bitmap_size;

		if (q->len > max_len) max_len = q->len;

		q = q->next;

	}

	SAYF("\n");

	if (avg_us > (qemu_mode ? 50000 : 10000)) 
		WARNF(cLRD "The target binary is pretty slow! See %s/perf_tips.txt.",
			doc_path);

  /* Let's keep things moving with slow binaries. */

  if (avg_us > 50000) havoc_div = 10;     /* 0-19 execs/sec   */
  else if (avg_us > 20000) havoc_div = 5; /* 20-49 execs/sec  */
  else if (avg_us > 10000) havoc_div = 2; /* 50-100 execs/sec */

	if (!resuming_fuzz) {

		if (max_len > 50 * 1024)
			WARNF(cLRD "Some test cases are huge (%s) - see %s/perf_tips.txt!",
				DMS(max_len), doc_path);
		else if (max_len > 10 * 1024)
			WARNF("Some test cases are big (%s) - see %s/perf_tips.txt.",
				DMS(max_len), doc_path);

		if (useless_at_start && !in_bitmap)
			WARNF(cLRD "Some test cases look useless. Consider using a smaller set.");

		if (queued_paths > 100)
			WARNF(cLRD "You probably have far too many input files! Consider trimming down.");
		else if (queued_paths > 20)
			WARNF("You have lots of input files; try starting small.");

	}

	OKF("Here are some useful stats:\n\n"

		cGRA "    Test case count : " cRST "%u favored, %u variable, %u total\n"
		cGRA "       Bitmap range : " cRST "%u to %u bits (average: %0.02f bits)\n"
		cGRA "        Exec timing : " cRST "%s to %s us (average: %s us)\n",
		queued_favored, queued_variable, queued_paths, min_bits, max_bits, 
		((double)total_bitmap_size) / (total_bitmap_entries ? total_bitmap_entries : 1),
		DI(min_us), DI(max_us), DI(avg_us));

	if (!timeout_given) {

    /* Figure out the appropriate timeout. The basic idea is: 5x average or
       1x max, rounded up to EXEC_TM_ROUND ms and capped at 1 second.

       If the program is slow, the multiplier is lowered to 2x or 3x, because
       random scheduler jitter is less likely to have any impact, and because
       our patience is wearing thin =) */

		if (avg_us > 50000) exec_tmout = avg_us * 2 / 1000;
		else if (avg_us > 10000) exec_tmout = avg_us * 3 / 1000;
		else exec_tmout = avg_us * 5 / 1000;

		exec_tmout = MAX(exec_tmout, max_us / 1000);
		exec_tmout = (exec_tmout + EXEC_TM_ROUND) / EXEC_TM_ROUND * EXEC_TM_ROUND;

		if (exec_tmout > EXEC_TIMEOUT) exec_tmout = EXEC_TIMEOUT;

		ACTF("No -t option specified, so I'll use exec timeout of %u ms.", 
			exec_tmout);

		timeout_given = 1;

	} else if (timeout_given == 3) {

		ACTF("Applying timeout settings from resumed session (%u ms).", exec_tmout);

	}

  /* In dumb mode, re-running every timing out test case with a generous time
     limit is very expensive, so let's select a more conservative default. */

	if (dumb_mode && !getenv("AFL_HANG_TMOUT"))
		hang_tmout = MIN(EXEC_TIMEOUT, exec_tmout * 2 + 100);

	OKF("All set and ready to roll!");

}

/* Handle stop signal (Ctrl-C, etc). */

static void handle_stop_sig(int sig) {

	stop_soon = 1; 

	if (child_pid > 0) kill(child_pid, SIGKILL);
	//todo need to pass through all of them
	if (forksrv_pid[0] > 0) kill(forksrv_pid[0], SIGKILL);

}


/* Handle skip request (SIGUSR1). */

static void handle_skipreq(int sig) {

	skip_requested = 1;

}

/* Handle timeout (SIGALRM). */

static void handle_timeout(int sig) {

	printf("In handle timeout\n");

	if (child_pid > 0) {
		printf("child pid is gonna die\n");
		child_timed_out = 1; 
		kill(child_pid, SIGKILL);

	} else if (child_pid == -1 && forksrv_pid[0] > 0) {

		child_timed_out = 1; 
		kill(forksrv_pid[0], SIGKILL);

	}
	if( block_pid > 0 ){
		printf("block_pid is gonna die\n");
		kill(block_pid, SIGKILL);
	}

}


/* Do a PATH search and find target binary to see that it exists and
   isn't a shell script - a common and painful mistake. We also check for
   a valid ELF header and for evidence of AFL instrumentation. */

EXP_ST void check_binary(u8* fname, u8** path) {

	u8* env_path = 0;
	struct stat st;

	s32 fd;
	u8* f_data;
	u32 f_len = 0;

	ACTF("Validating target binary...");

	if (strchr(fname, '/') || !(env_path = getenv("PATH"))) {

		*path = ck_strdup(fname);


		if (stat(*path, &st) || !S_ISREG(st.st_mode) ||
			!(st.st_mode & 0111) || (f_len = st.st_size) < 4)
			FATAL("Program '%s' not found or not executable", fname);

	} else {

		while (env_path) {

			u8 *cur_elem, *delim = strchr(env_path, ':');

			if (delim) {

				cur_elem = ck_alloc(delim - env_path + 1);
				memcpy(cur_elem, env_path, delim - env_path);
				delim++;

			} else cur_elem = ck_strdup(env_path);

			env_path = delim;

			if (cur_elem[0])
				*path = alloc_printf("%s/%s", cur_elem, fname);
			else
				*path = ck_strdup(fname);

			ck_free(cur_elem);

			if (!stat(*path, &st) && S_ISREG(st.st_mode) &&
				(st.st_mode & 0111) && (f_len = st.st_size) >= 4) break;

				ck_free(*path);
			*path = 0;

		}

		if (!*path) FATAL("Program '%s' not found or not executable", fname);

	}

	if (getenv("AFL_SKIP_BIN_CHECK")) return;

  /* Check for blatant user errors. */

	if ((!strncmp(*path, "/tmp/", 5) && !strchr(*path + 5, '/')) ||
		(!strncmp(*path, "/var/tmp/", 9) && !strchr(*path + 9, '/')))
		FATAL("Please don't keep binaries in /tmp or /var/tmp");

	fd = open(*path, O_RDONLY);

	if (fd < 0) PFATAL("Unable to open '%s'", *path);

	f_data = mmap(0, f_len, PROT_READ, MAP_PRIVATE, fd, 0);

	if (f_data == MAP_FAILED) PFATAL("Unable to mmap file '%s'", *path);

	close(fd);

	if (f_data[0] == '#' && f_data[1] == '!') {

		SAYF("\n" cLRD "[-] " cRST
			"Oops, the target binary looks like a shell script. Some build systems will\n"
			"    sometimes generate shell stubs for dynamically linked programs; try static\n"
			"    library mode (./configure --disable-shared) if that's the case.\n\n"

			"    Another possible cause is that you are actually trying to use a shell\n" 
			"    wrapper around the fuzzed component. Invoking shell can slow down the\n" 
			"    fuzzing process by a factor of 20x or more; it's best to write the wrapper\n"
			"    in a compiled language instead.\n");

		FATAL("Program '%s' is a shell script", *path);

	}

#ifndef __APPLE__

	if (f_data[0] != 0x7f || memcmp(f_data + 1, "ELF", 3))
		FATAL("Program '%s' is not an ELF binary", *path);

#else

	if (f_data[0] != 0xCF || f_data[1] != 0xFA || f_data[2] != 0xED)
		FATAL("Program '%s' is not a 64-bit Mach-O binary", *path);

#endif /* ^!__APPLE__ */

	if ( !memmem(f_data, f_len, SHM_ENV_VAR, strlen(SHM_ENV_VAR) + 1)) {

		SAYF("\n" cLRD "[-] " cRST
			"Looks like the target binary is not instrumented! The fuzzer depends on\n"
			"    compile-time instrumentation to isolate interesting test cases while\n"
			"    mutating the input data. For more information, and for tips on how to\n"
			"    instrument binaries, please see %s/README.\n\n"

			"    When source code is not available, you may be able to leverage QEMU\n"
			"    mode support. Consult the README for tips on how to enable this.\n"

			"    (It is also possible to use afl-fuzz as a traditional, \"dumb\" fuzzer.\n"
			"    For that, you can use the -n option - but expect much worse results.)\n",
			doc_path);

		FATAL("No instrumentation detected");

	}

	if (memmem(f_data, f_len, "libasan.so", 10) ||
		memmem(f_data, f_len, "__msan_init", 11)) uses_asan = 1;

		if (munmap(f_data, f_len)) PFATAL("unmap() failed");

}

/**
* Start all forkserver in the program and check their binary
**/
static void init_all_forkservers(char **argv){
	int index = optind, prog = 0;

	while (*(argv + index)){
	  	printf("%s\n", (*(argv + index)));
	  	check_binary(*(argv + index), &(target_path[prog])); // -> needed
	 	
	  	init_forkserver_special(argv, &target_path[prog], &forksrv_pid[prog], &fsrv_ctl_fd[prog], &fsrv_st_fd[prog], FORKSRV_FD + (prog * 2));
	  	//init_forkserver_special(argv, &target_path[prog], &forksrv_pid[prog], &fsrv_ctl_fd[prog], &fsrv_st_fd[prog], FORKSRV_FD);
	  	numbr_of_progs_under_test ++;
	  	index ++;
	  	prog ++;
	}
}

/* Check terminal dimensions after resize. */

static void check_term_size(void) {

	struct winsize ws;

	term_too_small = 0;

	if (ioctl(1, TIOCGWINSZ, &ws)) return;

	if (ws.ws_row < 25 || ws.ws_col < 80) term_too_small = 1;

}



/* Display usage hints. */

static void usage(u8* argv0) {

	SAYF("\n%s [ options ] -- /path/to/fuzzed_app [ ... ]\n\n"

		"Required parameters:\n\n"

		"  -i dir        - input directory with test cases\n"
		"  -o dir        - output directory for fuzzer findings\n\n"

		"Execution control settings:\n\n"

		"  -f file       - location read by the fuzzed program (stdin)\n"
		"  -t msec       - timeout for each run (auto-scaled, 50-%u ms)\n"
		"  -m megs       - memory limit for child process (%u MB)\n"
		"  -Q            - use binary-only instrumentation (QEMU mode)\n\n"     

		"Fuzzing behavior settings:\n\n"

		"  -d            - quick & dirty mode (skips deterministic steps)\n"
		"  -n            - fuzz without instrumentation (dumb mode)\n"
		"  -x dir        - optional fuzzer dictionary (see README)\n\n"

		"Other stuff:\n\n"

		"  -T text       - text banner to show on the screen\n"
		"  -M / -S id    - distributed mode (see parallel_fuzzing.txt)\n"
		"  -C            - crash exploration mode (the peruvian rabbit thing)\n\n"

		"For additional tips, please consult %s/README.\n\n",

		argv0, EXEC_TIMEOUT, MEM_LIMIT, doc_path);

	exit(1);

}


/* Prepare output directories and fds. */

EXP_ST void setup_dirs_fds(void) {

	u8* tmp;
	s32 fd;

	ACTF("Setting up output directories...");

	if (sync_id && mkdir(sync_dir, 0700) && errno != EEXIST)
		PFATAL("Unable to create '%s'", sync_dir);

	if (mkdir(out_dir, 0700)) {

		if (errno != EEXIST) PFATAL("Unable to create '%s'", out_dir);

		maybe_delete_out_dir();

	} else {

		if (in_place_resume)
			FATAL("Resume attempted but old output directory not found");

		out_dir_fd = open(out_dir, O_RDONLY);

#ifndef __sun

		if (out_dir_fd < 0 || flock(out_dir_fd, LOCK_EX | LOCK_NB))
			PFATAL("Unable to flock() output directory.");

#endif /* !__sun */

	}

  /* Queue directory for any starting & discovered paths. */

	tmp = alloc_printf("%s/queue", out_dir);
	if (mkdir(tmp, 0700)) PFATAL("Unable to create '%s'", tmp);
	ck_free(tmp);

  /* Top-level directory for queue metadata used for session
     resume and related tasks. */

	tmp = alloc_printf("%s/queue/.state/", out_dir);
	if (mkdir(tmp, 0700)) PFATAL("Unable to create '%s'", tmp);
	ck_free(tmp);

  /* Directory for flagging queue entries that went through
     deterministic fuzzing in the past. */

	tmp = alloc_printf("%s/queue/.state/deterministic_done/", out_dir);
	if (mkdir(tmp, 0700)) PFATAL("Unable to create '%s'", tmp);
	ck_free(tmp);

  /* Directory with the auto-selected dictionary entries. */

	tmp = alloc_printf("%s/queue/.state/auto_extras/", out_dir);
	if (mkdir(tmp, 0700)) PFATAL("Unable to create '%s'", tmp);
	ck_free(tmp);

  /* The set of paths currently deemed redundant. */

	tmp = alloc_printf("%s/queue/.state/redundant_edges/", out_dir);
	if (mkdir(tmp, 0700)) PFATAL("Unable to create '%s'", tmp);
	ck_free(tmp);

  /* The set of paths showing variable behavior. */

	tmp = alloc_printf("%s/queue/.state/variable_behavior/", out_dir);
	if (mkdir(tmp, 0700)) PFATAL("Unable to create '%s'", tmp);
	ck_free(tmp);

  /* Sync directory for keeping track of cooperating fuzzers. */

	if (sync_id) {

		tmp = alloc_printf("%s/.synced/", out_dir);

		if (mkdir(tmp, 0700) && (!in_place_resume || errno != EEXIST))
			PFATAL("Unable to create '%s'", tmp);

		ck_free(tmp);

	}

  /* All recorded crashes. */

	tmp = alloc_printf("%s/crashes", out_dir);
	if (mkdir(tmp, 0700)) PFATAL("Unable to create '%s'", tmp);
	ck_free(tmp);

  /* All recorded hangs. */

	tmp = alloc_printf("%s/hangs", out_dir);
	if (mkdir(tmp, 0700)) PFATAL("Unable to create '%s'", tmp);
	ck_free(tmp);

  /* Generally useful file descriptors. */

	dev_null_fd = open("/dev/null", O_RDWR);
	if (dev_null_fd < 0) PFATAL("Unable to open /dev/null");

	dev_urandom_fd = open("/dev/urandom", O_RDONLY);
	if (dev_urandom_fd < 0) PFATAL("Unable to open /dev/urandom");

  /* Gnuplot output file. */

	tmp = alloc_printf("%s/plot_data", out_dir);
	fd = open(tmp, O_WRONLY | O_CREAT | O_EXCL, 0600);
	if (fd < 0) PFATAL("Unable to create '%s'", tmp);
	ck_free(tmp);

	plot_file = fdopen(fd, "w");
	if (!plot_file) PFATAL("fdopen() failed");

	fprintf(plot_file, "# unix_time, cycles_done, cur_path, paths_total, "
		"pending_total, pending_favs, map_size, unique_crashes, "
		"unique_hangs, max_depth, execs_per_sec\n");
                     /* ignore errors */

}


/* Setup the output file for fuzzed data, if not using -f. */

EXP_ST void setup_stdio_file(void) {

	printf("\t-> in setup_stdio_file out_dir -> %s\n", out_dir);

	u8* fn = alloc_printf("%s/.cur_input", out_dir);

  unlink(fn); /* Ignore errors */

	out_fd = open(fn, O_RDWR | O_CREAT | O_EXCL, 0600);

	if (out_fd < 0) PFATAL("Unable to create '%s'", fn);

	ck_free(fn);

}


/* Make sure that core dumps don't go to a program. */

static void check_crash_handling(void) {

#ifdef __APPLE__

  /* Yuck! There appears to be no simple C API to query for the state of 
     loaded daemons on MacOS X, and I'm a bit hesitant to do something
     more sophisticated, such as disabling crash reporting via Mach ports,
     until I get a box to test the code. So, for now, we check for crash
     reporting the awful way. */

	if (system("launchctl list 2>/dev/null | grep -q '\\.ReportCrash$'")) return;

	SAYF("\n" cLRD "[-] " cRST
		"Whoops, your system is configured to forward crash notifications to an\n"
		"    external crash reporting utility. This will cause issues due to the\n"
		"    extended delay between the fuzzed binary malfunctioning and this fact\n"
		"    being relayed to the fuzzer via the standard waitpid() API.\n\n"
		"    To avoid having crashes misinterpreted as timeouts, please run the\n" 
		"    following commands:\n\n"

		"    SL=/System/Library; PL=com.apple.ReportCrash\n"
		"    launchctl unload -w ${SL}/LaunchAgents/${PL}.plist\n"
		"    sudo launchctl unload -w ${SL}/LaunchDaemons/${PL}.Root.plist\n");

	if (!getenv("AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES"))
		FATAL("Crash reporter detected");

#else

  /* This is Linux specific, but I don't think there's anything equivalent on
     *BSD, so we can just let it slide for now. */

	s32 fd = open("/proc/sys/kernel/core_pattern", O_RDONLY);
	u8  fchar;

	if (fd < 0) return;

	ACTF("Checking core_pattern...");

	if (read(fd, &fchar, 1) == 1 && fchar == '|') {

		SAYF("\n" cLRD "[-] " cRST
			"Hmm, your system is configured to send core dump notifications to an\n"
			"    external utility. This will cause issues: there will be an extended delay\n"
			"    between stumbling upon a crash and having this information relayed to the\n"
			"    fuzzer via the standard waitpid() API.\n\n"

			"    To avoid having crashes misinterpreted as timeouts, please log in as root\n" 
			"    and temporarily modify /proc/sys/kernel/core_pattern, like so:\n\n"

			"    echo core >/proc/sys/kernel/core_pattern\n");

		if (!getenv("AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES"))
			FATAL("Pipe at the beginning of 'core_pattern'");

	}

	close(fd);

#endif /* ^__APPLE__ */

}


/* Check CPU governor. */

static void check_cpu_governor(void) {

	FILE* f;
	u8 tmp[128];
	u64 min = 0, max = 0;

	if (getenv("AFL_SKIP_CPUFREQ")) return;

	f = fopen("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor", "r");
	if (!f) return;

	ACTF("Checking CPU scaling governor...");

	if (!fgets(tmp, 128, f)) PFATAL("fgets() failed");

	fclose(f);

	if (!strncmp(tmp, "perf", 4)) return;

	f = fopen("/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq", "r");

	if (f) {
		if (fscanf(f, "%llu", &min) != 1) min = 0;
		fclose(f);
	}

	f = fopen("/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq", "r");

	if (f) {
		if (fscanf(f, "%llu", &max) != 1) max = 0;
		fclose(f);
	}

	if (min == max) return;

	SAYF("\n" cLRD "[-] " cRST
		"Whoops, your system uses on-demand CPU frequency scaling, adjusted\n"
		"    between %llu and %llu MHz. Unfortunately, the scaling algorithm in the\n"
		"    kernel is imperfect and can miss the short-lived processes spawned by\n"
		"    afl-fuzz. To keep things moving, run these commands as root:\n\n"

		"    cd /sys/devices/system/cpu\n"
       "    echo performance | tee cpu*/cpufreq/scaling_governor\n\n"

		"    You can later go back to the original state by replacing 'performance' with\n"
		"    'ondemand'. If you don't want to change the settings, set AFL_SKIP_CPUFREQ\n"
		"    to make afl-fuzz skip this check - but expect some performance drop.\n",
		min / 1024, max / 1024);

	FATAL("Suboptimal CPU scaling governor");

}


/* Count the number of logical CPU cores. */

static void get_core_count(void) {

	u32 cur_runnable = 0;

#if defined(__APPLE__) || defined(__FreeBSD__) || defined (__OpenBSD__)

	size_t s = sizeof(cpu_core_count);

  /* On *BSD systems, we can just use a sysctl to get the number of CPUs. */

#ifdef __APPLE__

	if (sysctlbyname("hw.logicalcpu", &cpu_core_count, &s, NULL, 0) < 0)
		return;

#else

	int s_name[2] = { CTL_HW, HW_NCPU };

	if (sysctl(s_name, 2, &cpu_core_count, &s, NULL, 0) < 0) return;

#endif /* ^__APPLE__ */

#else

#ifdef HAVE_AFFINITY

	cpu_core_count = sysconf(_SC_NPROCESSORS_ONLN);

#else

	FILE* f = fopen("/proc/stat", "r");
	u8 tmp[1024];

	if (!f) return;

	while (fgets(tmp, sizeof(tmp), f))
		if (!strncmp(tmp, "cpu", 3) && isdigit(tmp[3])) cpu_core_count++;

	fclose(f);

#endif /* ^HAVE_AFFINITY */

#endif /* ^(__APPLE__ || __FreeBSD__ || __OpenBSD__) */

	if (cpu_core_count > 0) {

		cur_runnable = (u32)get_runnable_processes();

#if defined(__APPLE__) || defined(__FreeBSD__) || defined (__OpenBSD__)

    /* Add ourselves, since the 1-minute average doesn't include that yet. */

		cur_runnable++;

#endif /* __APPLE__ || __FreeBSD__ || __OpenBSD__ */

		OKF("You have %u CPU core%s and %u runnable tasks (utilization: %0.0f%%).",
			cpu_core_count, cpu_core_count > 1 ? "s" : "",
			cur_runnable, cur_runnable * 100.0 / cpu_core_count);

		if (cpu_core_count > 1) {

			if (cur_runnable > cpu_core_count * 1.5) {

				WARNF("System under apparent load, performance may be spotty.");

			} else if (cur_runnable + 1 <= cpu_core_count) {

				OKF("Try parallel jobs - see %s/parallel_fuzzing.txt.", doc_path);

			}

		}

	} else {

		cpu_core_count = 0;
		WARNF("Unable to figure out the number of CPU cores.");

	}

}

/* Validate and fix up out_dir and sync_dir when using -S. */

static void fix_up_sync(void) {

  u8* x = sync_id;

  if (dumb_mode)
    FATAL("-S / -M and -n are mutually exclusive");

  if (skip_deterministic) {

    if (force_deterministic)
      FATAL("use -S instead of -M -d");
    else
      FATAL("-S already implies -d");

  }

  while (*x) {

    if (!isalnum(*x) && *x != '_' && *x != '-')
      FATAL("Non-alphanumeric fuzzer ID specified via -S or -M");

    x++;

  }

  if (strlen(sync_id) > 32) FATAL("Fuzzer ID too long");

  x = alloc_printf("%s/%s", out_dir, sync_id);

  sync_dir = out_dir;
  out_dir  = x;

  if (!force_deterministic) {
    skip_deterministic = 1;
    use_splicing = 1;
  }

}


/* Handle screen resize (SIGWINCH). */

static void handle_resize(int sig) {
	clear_screen = 1;
}

/* Detect @@ in args. */
// TODO -> will we allow this? If so we need to allow it for every file or only specific ones?
EXP_ST void detect_file_args(char** argv) {

  u32 i = 0;
  u8* cwd = getcwd(NULL, 0);

  if (!cwd) PFATAL("getcwd() failed");

  while (argv[i]) {

    u8* aa_loc = strstr(argv[i], "@@");

    if (aa_loc) {

      u8 *aa_subst, *n_arg;

      /* If we don't have a file name chosen yet, use a safe default. */

      if (!out_file)
        out_file = alloc_printf("%s/.cur_input", out_dir);

      /* Be sure that we're always using fully-qualified paths. */

      if (out_file[0] == '/') aa_subst = out_file;
      else aa_subst = alloc_printf("%s/%s", cwd, out_file);

      /* Construct a replacement argv value. */

      *aa_loc = 0;
      n_arg = alloc_printf("%s%s%s", argv[i], aa_subst, aa_loc + 2);
      argv[i] = n_arg;
      *aa_loc = '@';

      if (out_file[0] != '/') ck_free(aa_subst);

    }

    i++;

  }

  free(cwd); /* not tracked */

}

/* Set up signal handlers. More complicated that needs to be, because libc on
   Solaris doesn't resume interrupted reads(), sets SA_RESETHAND when you call
   siginterrupt(), and does other stupid things. */

EXP_ST void setup_signal_handlers(void) {

	struct sigaction sa;

	sa.sa_handler   = NULL;
	sa.sa_flags     = SA_RESTART;
	sa.sa_sigaction = NULL;

	sigemptyset(&sa.sa_mask);

  /* Various ways of saying "stop". */

	sa.sa_handler = handle_stop_sig;
	sigaction(SIGHUP, &sa, NULL);
	sigaction(SIGINT, &sa, NULL);
	sigaction(SIGTERM, &sa, NULL);

  /* Exec timeout notifications. */

	sa.sa_handler = handle_timeout;
	sigaction(SIGALRM, &sa, NULL);

  /* Window resize */

	sa.sa_handler = handle_resize;
	sigaction(SIGWINCH, &sa, NULL);

  /* SIGUSR1: skip entry */

	sa.sa_handler = handle_skipreq;
	sigaction(SIGUSR1, &sa, NULL);

  /* Things we don't care about. */

	sa.sa_handler = SIG_IGN;
	sigaction(SIGTSTP, &sa, NULL);
	sigaction(SIGPIPE, &sa, NULL);

}

/* Make a copy of the current command line. */

static void save_cmdline(u32 argc, char** argv) {

  u32 len = 1, i;
  u8* buf;

  for (i = 0; i < argc; i++)
    len += strlen(argv[i]) + 1;
  
  buf = orig_cmdline = ck_alloc(len);

  for (i = 0; i < argc; i++) {

    u32 l = strlen(argv[i]);

    memcpy(buf, argv[i], l);
    buf += l;

    if (i != argc - 1) *(buf++) = ' ';

  }

  *buf = 0;

}



#ifndef AFL_LIB

/* Main entry point */

int main(int argc, char** argv) {

	printf("\nMain entry point of AFL FUzz\n");

	s32 opt;
	u8  mem_limit_given = 0;
	u64 prev_queued = 0;
  	u32 sync_interval_cnt = 0, seek_to;		
	char** use_argv;

	int path_index = 0;
	SAYF(cCYA "afl-fuzz " cBRI VERSION cRST " by <lcamtuf@google.com>\n");

	doc_path = access(DOC_PATH, F_OK) ? "docs" : DOC_PATH;

	while ((opt = getopt(argc, argv, "+i:o:p:m:")) > 0){

		switch (opt) {

      case 'i': /* input dir */

			if (in_dir) FATAL("Multiple -i options not supported");
			in_dir = optarg;
        //if (!strcmp(in_dir, "-")) in_place_resume = 1;

			break;

      case 'o': /* output dir */

			if (out_dir) FATAL("Multiple -o options not supported");
			out_dir = optarg;
			break;
	  case 'p':
	 		// remove
	    	//check_binary(optarg, &(target_path[path_index])); // -> needed
	    	//init_forkserver_special(argv, &target_path[path_index], &forksrv_pid[path_index], &fsrv_ctl_fd[path_index], &fsrv_st_fd[path_index], FORKSRV_FD);
	  		path_index ++;
	  		break;
      case 'm': { /* mem limit */

			u8 suffix = 'M';

			if (mem_limit_given) FATAL("Multiple -m options not supported");
			mem_limit_given = 1;

			if (!strcmp(optarg, "none")) {

				mem_limit = 0;
				break;

			}
			if (sscanf(optarg, "%llu%c", &mem_limit, &suffix) < 1 ||
				optarg[0] == '-') FATAL("Bad syntax used for -m");

				switch (suffix) {

					case 'T': mem_limit *= 1024 * 1024; break;
					case 'G': mem_limit *= 1024; break;
					case 'k': mem_limit /= 1024; break;
					case 'M': break;

					default:  FATAL("Unsupported suffix or bad syntax for -m");

				}

				if (mem_limit < 5) FATAL("Dangerously low value of -m");

				if (sizeof(rlim_t) == 4 && mem_limit > 2000)
					FATAL("Value of -m out of range on 32-bit systems");

			}

			break;


			default:
			printf("in default\n");
			usage(argv[0]);

		}
	}


  //printf("optind = %d\n", optind);
  //printf("argc = %d\n", argc);
  if ( optind == argc || !in_dir || !out_dir ){ printf("here in this option of ours\n");usage(argv[0]);}

  //numbr_of_progs_under_test = getenv(FORKSRV_AMOUNT_ENV) == NULL ? 1 : getenv(FORKSRV_AMOUNT_ENV); // get number of programs under test

  setup_signal_handlers(); // not needed to execture the forkserver, but might as well have it
  //check_asan_opts(); // -> not needed

  if (sync_id) fix_up_sync();

  save_cmdline(argc, argv); // -> not needed

  //fix_up_banner(argv[optind]);

  get_core_count(); // -> not needed, but might as well have it

  check_crash_handling();
  check_cpu_governor();

  setup_post();
  setup_shm(); // -> TODO -> need to add the specific ID that I want to set up
  init_count_class16(); //-> needed

  setup_dirs_fds(); // -> needed but not for the forkserer
  read_testcases();
  load_auto();

  pivot_inputs(); //not needed, but might as well have it

  //if (extras_dir) load_extras(extras_dir);

  if (!timeout_given) find_timeout();

  //detect_file_args(argv + optind + 1);

  if (!out_file) setup_stdio_file(); // -> needed!
  //printf("%s\n", tmp_test);

  start_time = get_cur_time();// -> not needed

  use_argv = argv + optind;
  /*
  int index = optind, prog = 0;

  while (*(argv + index)){
  	printf("%s\n", (*(argv + index)));
  	check_binary(*(argv + index), &(target_path[prog])); // -> needed
 	
  	init_forkserver_special(argv, &target_path[prog], &forksrv_pid[prog], &fsrv_ctl_fd[prog], &fsrv_st_fd[prog], FORKSRV_FD + (prog * 2));
  	//init_forkserver_special(argv, &target_path[prog], &forksrv_pid[prog], &fsrv_ctl_fd[prog], &fsrv_st_fd[prog], FORKSRV_FD);
  	numbr_of_progs_under_test ++;
  	index ++;
  	prog ++;
  }
  */

  /*we start forkservers here*/
  init_all_forkservers(argv);
  
  //cmp_program(argv, exec_tmout);
  //TODO -> make it perform a dry runon every program

  perform_dry_run(use_argv); //this will be where most of the work will be done for this iteration


  cull_queue(); // -> not needed, but very usefull and likely where i'll work the most

  show_init_stats(); //-> not needed but usefull

  seek_to = find_start_position();

  write_stats_file(0, 0, 0); //-> not needed, but important
  save_auto(); //-> not needed, but important

  if (stop_soon) goto stop_fuzzing;

  /* Woop woop woop */
  
  if (!not_on_tty) {
    sleep(4);
    start_time += 4000;
    if (stop_soon) goto stop_fuzzing;
  }

  if (queue_cur) show_stats();

  write_bitmap();
  write_stats_file(0, 0, 0);
  save_auto();

  stop_fuzzing:
  	SAYF(CURSOR_SHOW cLRD "\n\n+++ Testing aborted %s +++\n" cRST,
       stop_soon == 2 ? "programmatically" : "by user");
  /* Running for more than 30 minutes but still doing first cycle? */
  
  if (queue_cycle == 1 && get_cur_time() - start_time > 30 * 60 * 1000) {

    SAYF("\n" cYEL "[!] " cRST
           "Stopped during the first cycle, results may be incomplete.\n"
           "    (For info on resuming, see %s/README.)\n", doc_path);

  }
  
  fclose(plot_file);
  destroy_queue();
  destroy_extras();
  //ck_free(target_path);
  for(int i = 0; i < numbr_of_progs_under_test; i++) ck_free(target_path[i]);
  ck_free(sync_id);

  alloc_report();

  OKF("We're done here. Have a nice day! Or not, not like I care\n");

  exit(0);

}

#endif /* !AFL_LIB */
