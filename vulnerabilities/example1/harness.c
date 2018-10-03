#include "vul.h"

#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>


int main (int argc, char* argv[]){
	
	if(argc == 2){
		if(strcmp(argv[1],"mleak") == 0){
			char *line = NULL;
			size_t len = 0;
			ssize_t read;
			if ( (read = getline(&line, &len, stdin)) != -1 ){
				// do something
 			}
		}
		return 0;
	}
	/*
	char *line = NULL;
	size_t len = 0;
	ssize_t read;
	if ( (read = getline(&line, &len, stdin)) != -1 ){
		// do something
 	}
	char buff[len];
	strcpy(&buff, line);
	free(line);
	*/

	//int rc = getLine ("Enter string> ", buff, sizeof(buff));
	//if(rc == OK){
	//stack_overflow(buff);
	//heap_overflow(buff);
	//buffer_overflow(buff);
	//global_buffer_overflow(buff);
	//}

	int a;
	scanf("%d", &a);
	//printf("%d\n", integer_overflow(a)); //finds
	//integer_underflow(a); //finds
	//memory_leak();
	void *pointer = malloc(sizeof(void) * 45);
	//free(pointer);
	//dangling_pointer(a);
	//use_after_free(a);
	//negative_memory_allocation();
	//out_of_bounds(a);
	//division_by_zero(a); //finds
	//printf("%u\n",unsigned_int(a));
	printf("did not crash\n");

}
