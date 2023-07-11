#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

void *message(void *threadId){
	int num= 1;
	num = (int)threadId;
	printf("\n%ld",num);
}


int main(){
	pthread_t id[4];
	long i;
	for(i=0; i<4; i++){
		printf ("IN:main creadting thread %d\n", i);
		pthread_create(&id[i], NULL, message, (void*)i);
	}
	
	for(i=0; i<4; i++)
		pthread_join(id[i], 0);

	return 0;
}
