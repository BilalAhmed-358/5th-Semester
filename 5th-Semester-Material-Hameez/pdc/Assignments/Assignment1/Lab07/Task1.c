#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void *func1(){
	int num = 5, i;
	for(i=1; i<=1000; i++)
		printf("\n%d x %d : %d",num,i, num*i);
}

void *func2(){
	int num = 6, i;
	for(i=1; i<=1000; i++)
		printf("\n%d x %d : %d",num,i, num*i);
}

void *func3(){
	int num = 7, i;
	for(i=1; i<=1000; i++)
		printf("\n%d x %d : %d",num,i, num*i);
}

void *func4(){
	int num = 8, i;
	for(i=1; i<=1000; i++)
		printf("\n%d x %d : %d",num,i, num*i);
}

int main(){
	pthread_t threads[4];
	
	pthread_create(&threads[0], NULL, func1, NULL);
	pthread_join(threads[0], NULL);
	printf("\n----------------------------");
	
	pthread_create(&threads[1], NULL, func2, NULL);
	pthread_join(threads[1], NULL);
	printf("\n----------------------------");
	
	pthread_create(&threads[2], NULL, func3, NULL);
	pthread_join(threads[2], NULL);
	printf("\n----------------------------");
	
	pthread_create(&threads[3], NULL, func4, NULL);
	pthread_join(threads[3], NULL);
	
	return 0;
}
