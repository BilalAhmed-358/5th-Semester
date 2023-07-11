#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(){
	int num;
	int i;
	printf("Table [PROMPT] Enter Your Number: "); 
	scanf("%d",&num);
	
	#pragma omp parallel num_threads(10)
	#pragma omp for
	for(i=0;i<10;i++) {
		printf("Table [INFO] Thread ID: %d | %d X %d = %d \n", omp_get_thread_num(), i, num, i*num);
	}
	
	return 0;
}
