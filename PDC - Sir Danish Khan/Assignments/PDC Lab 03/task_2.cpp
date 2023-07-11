#include <iostream>
#include <map>
#include <omp.h>
#include <fstream>
#include <bits/stdc++.h>
using namespace std;

int main()
{
    map<string, int> words;
    map<string, int> words1;
    fstream file;
    string word, filename;
    int count = 0;
    filename = "test.txt";
    file.open(filename.c_str());
    while (file >> word)
    {
        // cout << word << endl;
        words.insert({word, 0});
        count++;
    }
    file.close();
    words1 = words;
    // for (auto it = words.cbegin(); it != words.cend(); it++)
    // {
    //     cout << it->first << " " << it->second << endl;
    // }
    // cout << count << endl;
    omp_set_num_threads(2);
#pragma omp parallel
    {
        if (omp_get_thread_num() == 0)
        {
            int local_c = 0, local_words = 0;
            file.open(filename.c_str());
            while (file >> word && local_c < count / 2)
            {
                // cout << word << endl;
                auto it = words.find(word);
                // cout << it->first << " " << it->second << endl;
                if (it != words.end())
                {
                    it->second++;
                    // cout<<it->second<<endl;
                    local_words++;
                }
                local_c++;
            }
            file.close();
            cout << "Total words in this thread " << local_words << endl;
            cout << "Total words overall " << count << endl;
        }
        if (omp_get_thread_num() == 1)
        {
            int local_c1 = 0, local_words1 = 0;
            file.open(filename.c_str());
            while (file >> word && local_c1 < count)
            {
                // cout << word << endl;
                if (local_c1 > count / 2)
                {
                    auto it = words1.find(word);
                    // cout << it->first << " " << it->second << endl;
                    if (it != words1.end())
                    {
                        it->second++;
                        local_words1++;
                    }
                }
                local_c1++;
            }
            file.close();
            cout << "Total words in this thread " << local_words1 << endl;
            cout << "Total words overall " << count << endl;
        }
    }
    for (auto it = words.cbegin(); it != words.cend(); it++)
    {
        cout << it->first << " " << it->second << endl;
    }
}