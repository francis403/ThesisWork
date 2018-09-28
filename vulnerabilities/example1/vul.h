
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
* Could potentially result in dangling_pointer error
**/
void dangling_pointer(int a);

float *memory_leak();

void global_buffer_overflow(char *x);

void use_after_free(int a);
