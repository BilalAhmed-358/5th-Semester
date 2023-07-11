#include <iostream>
#include <map>
#include <omp.h>
#include <fstream>
#include <mpi.h>
#include <bits/stdc++.h>
using namespace std;

int main(int argc, char *argv[])
{
    int npes, rank;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &npes);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    map<string, int> wordsmap;
    vector<string> text_of_article[4];
    fstream file;
    string word, filename, output_;
    int count = 0, temp_count = 0;
    fstream result;
    result.open("Q3_ans.txt", ios_base::out);
    filename = "test.txt";
    file.open(filename.c_str());
    while (file >> word)
    {
        wordsmap.insert({word, 0});
        count++;
    }
    file.close();
    int chunk = count / 4;
    file.open(filename.c_str());

    while (file >> word)
    {
        if (temp_count < chunk * 1)
        {
            text_of_article[0].push_back(word);
            temp_count++;
            continue;
        }
        else if (temp_count < chunk * 2)
        {
            text_of_article[1].push_back(word);
            temp_count++;
            continue;
        }
        else if (temp_count < chunk * 3)
        {
            text_of_article[2].push_back(word);
            temp_count++;
            continue;
        }
        else if (temp_count < chunk * 4)
        {
            text_of_article[3].push_back(word);
            temp_count++;
            continue;
        }
    }

    int local_sum = 0;
    for (int i = 0; i < text_of_article[rank].size(); i++)
    {
        wordsmap[text_of_article[rank][i]]++;
        local_sum++;
    }
    MPI_Send(&local_sum, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);

    MPI_Barrier(MPI_COMM_WORLD);
    result.close();
    if (rank == 0)
    {
        fstream result;
        result.open("Q4_ans.txt", ios_base::out);
        if (!result)
            cout << "Answer file couldn't be created" << endl;
        string output_;
        int global_sum = 0;
        for (int i = 0; i < 4; i++)
        {
            MPI_Recv(&local_sum, 1, MPI_INT, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            global_sum += local_sum;
        }
        cout << "The global sum of all the words in threads is " << global_sum << "." << endl;
        output_ += "The global sum of all the words in threads is ";
        output_ += to_string(global_sum);
        output_ += ".\n";
        result << output_;
        result.close();
    }

    MPI_Finalize();
}