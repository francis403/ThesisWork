// Copyright 2016 Google Inc. All Rights Reserved.
// Licensed under the Apache License, Version 2.0 (the "License");

#include <stdint.h>
#include <stddef.h>
#include <string.h>

/**
* Found by libFuzzer
**/
void stack_overflow(const char *x)
{
    char y[3];
    strcpy(y, x);
}

/**
* Found by libFuzzer
**/
void heap_overflow(const char *x)
{
    //char *y = malloc(strlen(x));
    char *y = new char[strlen(x)];
    strcpy(y, x);
}

int integer_overflow(int a)
{
    return a * 10000;
}


extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
	char *val = (char *) data;
	//stack_overflow(val);
  	heap_overflow(val);
  	return 0;
}
