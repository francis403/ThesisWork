// A C program to demonstrate sumple erros

#include "vul.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>


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
    char *y = malloc(strlen(x));
    strcpy(y, x);
}

int integer_overflow(int a)
{
    return a * 10000;
}

