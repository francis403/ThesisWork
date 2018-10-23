
/**
* Could potentially result in a buffer_overflow
* Found by AFL, libFuzzer
**/
void buffer_overflow(char *buff);

/**
* Could potentially result in a stack_overflow
* Found by libFuzzer, AFL
**/
void stack_overflow(const char *x);

/**
* Could potentially result in a heap_overflow
* Found by libFuzzer, AFL
**/
void heap_overflow(const char *x);

/**
* Could potentially result in a integer_overflow
* Found by libFuzzer, AFL
**/
int integer_overflow(int a);

int integer_underflow(int a);

/**
* Could potentially result in a unsigned int bug
* Found by AFL
**/
unsigned int unsigned_int(int a);

/**
* Could potentially result in dangling_pointer error
**/
void dangling_pointer(int a);

void memory_leak();

/**
* Could potentially result in a global buffer overflow bug
* Found by AFL
* NOTE: array needs to be initialized 
**/
void global_buffer_overflow(char *x);

/**
* Could potentially result in a use_after_free bug
* Found by AFL
**/
void use_after_free(int a);

char *negative_memory_allocation();

/**
* Could potentially result in a array out of bounds bug
* Found by AFL
**/
void out_of_bounds(int a);

/**
* Could potentially result in a division by zero bug
* Found by AFL
**/
int division_by_zero(int a);

unsigned short unsigned_overflow(int b);

void truncating_unsigned(int a);

void sign_conversion();
