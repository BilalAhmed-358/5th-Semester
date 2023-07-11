#include <bits/stdc++.h>
#include <mpi.h>
using namespace std;

int main(int argc, char *argv[])
{
    char msg[20];
    int array[] = {11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22};
    int array2[] = {79, 99, 01, 07};
    int rec[5];
    int myrank, tag = 99;
    MPI_Init(&argc, &argv);
    MPI_Status status;
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    if (myrank == 0)
    {
        strcpy(msg, "Hello world");
        MPI_Send(msg, 12, MPI_CHAR, 1, tag, MPI_COMM_WORLD);
    }
    if (myrank == 1)
    {
        MPI_Recv(msg, 12, MPI_CHAR, 0, tag, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        cout << "The message received from rank 0  by rank 1 sent through MPI_Send is:" << endl;
        for (int i = 0; i < 12; i++)
        {
            printf("%c", msg[i]);
        }
        cout << endl;
    }
    MPI_Barrier(MPI_COMM_WORLD);
    MPI_Bcast(array2, 2, MPI_INT, 1, MPI_COMM_WORLD);
    MPI_Barrier(MPI_COMM_WORLD);
    cout << "Following message recieved by rank " << myrank << " from rank 01 sent through MPI_Bcast is:" << endl;
    for (int i = 0; i < 2; i++)
    {
        cout << array2[i] << " ";
    }
    cout << endl;
    MPI_Barrier(MPI_COMM_WORLD);
    cout << endl;
    MPI_Scatter(array2, 3, MPI_INT, rec, 3, MPI_INT, 3, MPI_COMM_WORLD);
    cout << "Data recieved by node " << myrank << " from node 3 via MPI_Scatter is"
         << " : " << endl;
    for (int i = 0; i < 3; i++)
    {
        cout << rec[i] << " ";
    }
    cout << endl;
    MPI_Barrier(MPI_COMM_WORLD);
    int gather_data = array2[myrank];
    MPI_Gather(&gather_data, 1, MPI_INT, rec, 1, MPI_INT, 1, MPI_COMM_WORLD);
    if (myrank == 1)
    {
        cout << "The data recieved by rank 2 from other processes via MPI_Gather is:" << endl;
        for (int i = 0; i < 4; i++)
        {
            cout << rec[i] << " ";
        }
        cout << endl;
    }
    cout << "The data recieved via MPI_Allgather function by rank " << myrank << " is:" << endl;
    MPI_Barrier(MPI_COMM_WORLD);
    MPI_Allgather(rec, 1, MPI_INT, array2, 1, MPI_INT, MPI_COMM_WORLD);
    for (int i = 0; i < 4; i++)
    {
        cout << array2[i] << " ";
    }
    cout << endl;

    MPI_Finalize();
}