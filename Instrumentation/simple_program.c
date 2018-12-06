#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>


int MAX_LINE = 150;


int add0(){
	return 15;
}

int add(int b){
	if(b % 2 == 0)
		return b + 4;
	return b;
}

int add2(int b){
	if( b % 2 == 0 )
		return b + 4;
	return b;
}

/**
* Calls another function
* Shares a block code with all the previous functions
**/
int add3(int val){
	if ( val % 3 == 0){
		return add2(val);
	}
	return val;
}


int main (int argc, char* argv[]){
	
	
	int decider;
	printf("Decider = ");
	scanf("%d", &decider);
	if( decider > 5 ){
		printf("This is what happens when the condition is true\n");
		printf("add %d + 4 = %d\n",decider, add(decider));
	}
	else{
		printf("This is what happens when the condition is false\n");
		printf("add2 %d + 4 = %d\n",decider, add2(decider));
	}	

	printf("%d\n", add0());
	printf("This always happens\n");


  return 0;

}