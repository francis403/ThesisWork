#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>


int main (int argc, char* argv[]){
	
	int decider;
	printf("Decider = ");
	scanf("%d\n", &decider);

	if( decider > 5 ){
		printf("This is what happens when the condition is true\n");
	}
	else{
		printf("This is what happens when the condition is false\n");
		add(decider);
	}	

	printf("This always happens\n");

	return 0;

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