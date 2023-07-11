#include <stdio.h>
#include <stdlib.h>
#include <omp.h>


int main(int argc, char* argv[])
{

	omp_set_num_threads(4);

	#pragma omp parallel
	{
		#pragma omp sections
		{
			#pragma omp section
			{
				printf("Hi there, this is section number  %d.\n", omp_get_thread_num());
			}

			#pragma omp section
			{
				printf("Hi there, this is section number %d.\n", omp_get_thread_num());
			}
			
			#pragma omp section
			{
				printf("Hi there, this is section number %d.\n", omp_get_thread_num());
			}
			
			#pragma omp section
			{
				printf("Hi there, this is section number %d.\n", omp_get_thread_num());
			}
		}
	}

	return 0;
}
