#include <iostream>
#include <omp.h>
#include <fstream>
#include <vector>
#include <sstream>
using namespace std;

int main()
{

    fstream file;
    string line;
    vector<string> contents;
    vector<string> awin;
    int noOfLines;

    // Read from the file and store file content in contents.
    file.open("file.txt", ios::in);
    if (!file)
    {
        cout << "No file exists";
    }

    else
    {

        while (1)
        {

            if (file.eof())
            {
                break;
            }
            getline(file, line);
            contents.push_back(line);
        }
    }
    file.close();

    noOfLines = contents.size();
    int noOfThreads = 4;
    int wordCount = 0;
    int totalWordCount = 0;
    int localResults[noOfThreads];

    file.open("copy.txt", ios::out);
    for (int i = 0; i < noOfLines; i++)
    {
        file << contents[i];
    }
    file.close();

#pragma omp parallel firstprivate(wordCount) firstprivate(contents) private(file) num_threads(noOfThreads) private(line) shared(totalWordCount)
    {
        // Creating filenames to store the data for each of the threads
        string filename = "thread_";
        int x = omp_get_thread_num();
        filename += to_string(x) + "_data.txt";
        file.open(filename, ios::out);

        // Partitioning data between threads
        for (int i = (omp_get_thread_num() * (noOfLines / noOfThreads)); i < ((omp_get_thread_num() + 1) * (noOfLines / noOfThreads)); i++)
        {

            line = contents[i];

            // tokenizing the line to extract words:
            stringstream splitter(line);

            string t;

            while (getline(splitter, t, ' '))
            {
                file << t << " ";
                wordCount++;
            }
        }

        // If number of lines are not evenly divisible by noOfThreads, we give the remaining lines to the master thread
        if (noOfLines % noOfThreads != 0)
        {
            if (omp_get_thread_num() == 0)
            {

                for (int i = noOfThreads * (noOfLines / noOfThreads); i < noOfLines; i++)
                {

                    line = contents[i];

                    // tokenizing the line to extract words:
                    stringstream splitter(line);

                    string t;

                    while (getline(splitter, t, ' '))
                    {
                        file << t << " ";
                        wordCount++;
                    }
                }
            }
        }
        // saving local results to an array
        localResults[omp_get_thread_num()] = wordCount;

        cout << "Word Count for thread number " << omp_get_thread_num() << ": " << wordCount << endl;
        file << endl
             << endl
             << "Local Word Count: " << wordCount << endl;
        file.close();

#pragma omp barrier
#pragma omp single nowait
        {

            // adding local results:

            for (int i = 0; i < noOfThreads; i++)
            {
                totalWordCount += localResults[i];
            }
            cout << endl
                 << "Summed by thread " << omp_get_thread_num() << endl;
        }
    }
    // sequential region
    cout << "Total Word Count: " << totalWordCount;

    return 0;
}