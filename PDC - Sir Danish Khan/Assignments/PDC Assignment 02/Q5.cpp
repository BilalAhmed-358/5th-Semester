#include <iostream>
#include <map>
#include <omp.h>
#include <fstream>
#include <bits/stdc++.h>
#include <mpi.h>
using namespace std;

int main(int agrc, char *argv[])
{
    int npes, rank;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &npes);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    int array[100] = {0};

    MPI_Alltoall(&arr, 25, MPI_INT, &arr_, 25, MPI_INT, MPI_COMM_WORLD);
    MPI_Finalize();
}