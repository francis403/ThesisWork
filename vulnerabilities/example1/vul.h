
/**
* Could potentially result in a buffer_overflow
* Found by AFL, libFuzzer
**/
void buffer_overflow(char *buff);

/**
* Could potentially result in a stack_overflow
* Not found by AFL
* Found by libFuzzer
**/
void stack_overflow(const char *x);

/**
* Could potentially result in a heap_overflow
* Not found by AFL
* Found by libFuzzer
**/
void heap_overflow(const char *x);

/**
* Could potentially result in a integer_overflow
* Not found by AFL
* Found by libFuzzer
**/
int integer_overflow(int a);
