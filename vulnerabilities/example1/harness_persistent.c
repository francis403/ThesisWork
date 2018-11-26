#include "vul.h"
#include <unistd.h>
#include <string.h>
#include <stdio.h>



int main (){
	char buff[20];
	while(__AFL_LOOP(1000)){ //AFL persistent mode (should be faster)
		char *line = NULL;
		size_t len = 0;
		ssize_t read;
		if ( (read = getline(&line, &len, stdin)) != -1 ){
			// do something
 		}
		char buff[len];
		strcpy(&buff, line);
		free(line);
		int a;

		stack_overflow(buff);		

		//scanf("%d", &a);
		//printf("%d\n", integer_overflow(a));
		//integer_underflow(a);
		//dangling_pointer(a);
		//memory_leak();
		printf("did not crash\n");
	}
}
