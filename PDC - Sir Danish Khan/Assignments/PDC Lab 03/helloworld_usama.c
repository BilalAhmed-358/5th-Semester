#include <mpi.h>
#include <stdio.h>


int main(int argc, char *argv[])

{

int one, two;

MPI_Init(&argc, &argv);

MPI_Comm_size(MPI_COMM_WORLD, &one);

MPI_Comm_rank(MPI_COMM_WORLD, &two);

if (two==1) {

printf("From process %d out of %d, Hello World!\n", two, one);
}

else if(two==0) {
printf("hi kashif %d out of %d, kashif\n", two, one);
}
MPI_Finalize();

}
