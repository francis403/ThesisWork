// Copyright 2016 Google Inc. All Rights Reserved.
// Licensed under the Apache License, Version 2.0 (the "License");

#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <iostream>
#include <cstdlib>

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

/**
* Deleting an object from memory explicitly or by destroying
* The stack frame on return does not alter associated pointers.
* The pointer still points to the same location in memory even 
* though it may now be used for other purposes
**/
void dangling_pointer(int a){
	//printf("entered dangling pointer\n");

	if (a != 10)
		return;

	char *dp = NULL;
	if( 1 ){
		char c = 'b';
		dp = &c;
	}
	/* c falls out of scope */
	/*dp is now a dangling pointer*/
	//printf("%s\n",dp);
}

void use_after_free(int a){
	if(a != 10){ return; }
	char *buff = {0};
	free(buff);
	std::cout << buff;
	//printf("%s\n",buff);
}


extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
	char *val = (char *) data;
	//stack_overflow(val);
  	//heap_overflow(val);
	//dangling_pointer(10);
	
	//use_after_free(num);
  	return 0;
}


