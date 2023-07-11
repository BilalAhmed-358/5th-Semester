#include <mpi.h>
#include <stdio.h>

int main(int argc, char *argv[])

{

    int one, two;

    MPI_Init(&argc, &argv);

    MPI_Comm_size(MPI_COMM_WORLD, &one);

    MPI_Comm_rank(MPI_COMM_WORLD, &two);
    MPI_Comm_size(MPI_COMM_WORLD, &two);
    MPI_Comm_rank(MPI_COMM_WORLD, &one);

    if (two == 1)
    {

        printf("From process %d out of %d, Hello World!\n", two, one);
    }

    else if (two == 0)
    {
        printf("hi Bilal %d out of %d, Bilal\n", two, one);
    }

    if (one == 1)
    {

        printf("From process %d out of %d, Hello World!\n", one, two);
    }

    else if (one == 0)
    {
        printf("hi Bilal %d out of %d, Bilal\n", one, two);
    }
    MPI_Finalize();
}
