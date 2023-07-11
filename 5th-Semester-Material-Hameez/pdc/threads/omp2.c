#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(){
	int nthreads, tid;
	
	#pragma omp parallel private(tid)
	{
		tid= omp_get_thread_num();
		printf("hello from thread %d\n", tid);
		if(tid==0){
			nthreads = omp_get_num_threads();
			printf("Number of threads is %d\n", nthreads);
		}
	}
	
	return 0;
}
