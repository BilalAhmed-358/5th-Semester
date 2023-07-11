#include <iostream>
#include <map>
#include <omp.h>
#include <fstream>
#include <bits/stdc++.h>
using namespace std;

int main()
{
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
    omp_set_num_threads(4);
#pragma omp parallel
    {
        int local_sum = 0;
        int id = omp_get_thread_num();
        for (int i = 0; i < text_of_article[id].size(); i++)
        {
#pragma omp critical
            {
                local_sum++;
                wordsmap[text_of_article[id][i]]++;
            }
        }
        cout << "Words counted by thread " << id << " are " << local_sum << "." << endl;
#pragma omp critical
        {
            output_ += "Words counted by thread ";
            output_ += to_string(id);
            output_ += " are ";
            output_ += to_string(local_sum);
            output_ += ".\n";
        }
    }

    temp_count = 0;
    result << "The frequency map of the text is given below: \nThe count of each thread and the total words will be listed at the end of the map (its quite big map so you'll have to scroll for a bit or you can use Ctrl+End to reach the end of the file)\n";
    string entry;
    for (auto it = wordsmap.cbegin(); it != wordsmap.cend(); it++)
    {
        entry = "";
        temp_count += it->second;
        cout << it->first << ":" << it->second << endl;
        entry += it->first;
        entry += ":";
        entry += to_string(it->second);
        entry += "\n";
        result << entry;
    }

    output_ += "The size of the map (unique words) is ";
    output_ += to_string(wordsmap.size());
    output_ += " and the total number of words is ";
    output_ += to_string(count);
    output_ += ".\n";
    output_ += "The total number of words is counted via parallel threads is ";
    output_ += to_string(temp_count);
    output_ += ".\n";
    result << output_;
    cout << output_;
    result.close();
}