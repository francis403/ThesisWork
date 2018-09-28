// A C program to demonstrate sumple erros

#include "vul.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>


void buffer_overflow(char *buff){
	// Reserve 5 byte of buffer plus the terminating NULL. 
       // should allocate 8 bytes = 2 double words, 
       // To overflow, need more than 8 bytes... 
       char buffer[5];  // If more than 8 characters input 
                        // by user, there will be access  
                        // violation, segmentation fault 
  
      
  
       // copy the user input to mybuffer, without any 
       // bound checking a secure version is srtcpy_s() 
       strcpy(buffer, buff); 
       printf("buffer content= %s\n", buffer); 
  
       // you may want to try strcpy_s() 
       printf("strcpy() executed...\n"); 
}

void stack_overflow(const char *x)
{
    char y[3];
    strcpy(y, x);
}


void heap_overflow(const char *x)
{
    if(strlen(x) == 1){
	return;
    }
    char *y = malloc(strlen(x));
    strcpy(y, x);
}

int integer_overflow(int a)
{
    printf("Gonna call integer_overflow\n");
	if(a == 101){
		return INT_MAX + 1;	
	}
    return a;
}

/**
* Impossible to happen by chance
**/
int integer_underflow(int a)
{
    return a == 101 ? INT_MIN - 1 : a;
}


/**
* Deleting an object from memory explicitly or by destroying
* The stack frame on return does not alter associated pointers.
* The pointer still points to the same location in memory even 
* though it may now be used for other purposes
**/
void dangling_pointer(int a){

	char *dp = NULL;
	if( a == 10 ){
		char c = 'c';
		dp = &c;
	}
	/* c falls out of scope */
	/*dp is now a dangling pointer*/
	printf("%s\n",dp);
}

/**
* Allocate some memory and delibery forgotten to free it
**/
void memory_leak(){
	float *a = malloc(sizeof(float) * 45);
	float b = 42;
	a = &b;
}




