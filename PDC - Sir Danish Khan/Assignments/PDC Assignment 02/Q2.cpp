#include <iostream>
#include <map>
#include <fstream>
#include <bits/stdc++.h>
#include <mpi.h>
// Use 4 threads to run this program!
using namespace std;

int main(int argc, char *argv[])
{
    int npes, rank;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &npes);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    vector<string> wordsmap;
    vector<string> partition[4];
    fstream file;
    string word, output_;
    int count = 0, temp_count = 0, parallel_count = 0, chunk = 0;
    file.open("test.txt");
    while (file >> word)
    {
        wordsmap.push_back(word);
        count++;
    }
    chunk = count / 4;
    file.clear();
    file.seekg(0);
    while (file >> word)
    {
        if (temp_count < chunk * 1)
        {
            partition[0].push_back(word);
            temp_count++;
            continue;
        }
        else if (temp_count < chunk * 2)
        {
            partition[1].push_back(word);
            temp_count++;
            continue;
        }
        else if (temp_count < chunk * 3)
        {
            partition[2].push_back(word);
            temp_count++;
            continue;
        }
        else if (temp_count < chunk * 4)
        {
            partition[3].push_back(word);
            temp_count++;
            continue;
        }
    }

    temp_count = 0;
    for (int i = 0; i < partition[rank].size(); i++)
    {
        temp_count++;
    }
    MPI_Send(&temp_count, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
    cout << "The total number of words in the current thread is " << temp_count << ".\n";

    MPI_Barrier(MPI_COMM_WORLD);
    if (rank == 0)
    {
        fstream result;
        result.open("Q2_ans.txt", ios_base::out);
        if (!result)
            cout << "Answer file couldn't be created" << endl;
        string output_;
        int global_sum = 0;
        for (int i = 0; i < 4; i++)
        {
            MPI_Recv(&temp_count, 1, MPI_INT, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            global_sum += temp_count;
        }

        cout << "The global sum  of all the threads is " << global_sum << "." << endl;
        output_ += "The global sum  of all the threads is ";
        output_ += to_string(global_sum);
        output_ += ".\n";
        result << output_;
        result.close();
    }
    MPI_Finalize();
    file.close();
};