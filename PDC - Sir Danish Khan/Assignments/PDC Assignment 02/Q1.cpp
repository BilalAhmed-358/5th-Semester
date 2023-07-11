#include <iostream>
#include <map>
#include <omp.h>
#include <fstream>
#include <bits/stdc++.h>
using namespace std;

int main()
{
    vector<string> wordsmap;
    fstream file;
    string word, filename, output_;
    fstream result;
    result.open("Q1_ans.txt", ios_base::out);
    int count = 0, temp_count = 0, parallel_count = 0;
    filename = "test.txt";
    file.open(filename.c_str());
    while (file >> word)
    {
        wordsmap.push_back(word);
        count++;
    }
    file.close();
    int chunk = count / 4;
    vector<string> text_of_article[4];
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
    omp_set_num_threads(4);
#pragma omp parallel reduction(+ \
                               : parallel_count)
    {
        int local_sum = 0;
        int id = omp_get_thread_num();
        for (int i = 0; i < text_of_article[id].size(); i++)
        {
            parallel_count++;
            local_sum++;
        }
#pragma omp critical
        {
            output_ += "Words counted by thread ";
            output_ += to_string(id);
            output_ += " are ";
            output_ += to_string(local_sum);
            output_ += ".\n";
            cout << "Words counted by thread " << id << " are " << local_sum << "." << endl;
        }
    }

    cout << "The total number of words in the given document when counted serially is " << count << "." << endl;
    cout << "The total number of words is counted via parallel threads is " << parallel_count << "." << endl;

    output_ += "The total number of words in the given document when counted serially is  ";
    output_ += to_string(count);
    output_ += ".\n";
    output_ += "The total number of words is counted via parallel threads is ";
    output_ += to_string(parallel_count);
    output_ += ".\n";
    result << output_;
    result.close();
}