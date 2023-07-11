#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

void* thread1(){
	printf("hello world\n");
	
}

void* thread2(){
	printf("hello ashmal");
}

int main(){
	pthread_t t1, t2;
	pthread_create(&t1, NULL, thread1, NULL);
	pthread_create(&t2, NULL, thread2, NULL);
	
	pthread_join(t1, NULL);
	pthread_join(t2, NULL);
	
	return 0;
}
