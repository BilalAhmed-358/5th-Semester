#include <bits/stdc++.h>
#include <omp.h>
using namespace std;
set<string> data_key;
set<string> first_item_set;
vector<vector<string>> data_;
void map_(vector<vector<string>> data_)
{
    int num = omp_get_thread_num();
    for (int i = 0; i < data_[num].size(); i++)
    {

        if (data_key.find(data_[num][i]) != data_key.end())
        {
            // cout << data_[num][i] << endl;
            first_item_set.insert(data_[num][i]);
        }
        data_key.insert(data_[num][i]);
    }
}
int main()
{
    data_.push_back(vector<string>());
    data_[0].push_back("Eggs");
    data_[0].push_back("Apple");
    data_.push_back(vector<string>());
    data_[0].push_back("Diaper");
    data_[0].push_back("Milk");
    data_.push_back(vector<string>());
    data_[0].push_back("Soap");
    data_[0].push_back("Toothpaste");
    data_.push_back(vector<string>());
    data_[0].push_back("Toothpaste");
    data_[0].push_back("Mask");
    data_.push_back(vector<string>());
    data_[0].push_back("Eggs");
    data_[0].push_back("Milk");
    data_.push_back(vector<string>());
    data_[0].push_back("Mask");
    data_[0].push_back("Toothpaste");
    data_.push_back(vector<string>());
    data_[0].push_back("Diaper");
    data_[0].push_back("Beer");
    data_.push_back(vector<string>());
    data_[0].push_back("Apple");
    data_[0].push_back("Mask");
    data_.push_back(vector<string>());
    data_[0].push_back("Eggs");
    data_[0].push_back("Apple");
    data_.push_back(vector<string>());
    data_[0].push_back("Banana");
    data_[0].push_back("Honey");
#pragma omp parallel
    {
#pragma omp critical
        map_(data_);
    }
    for (auto i : first_item_set)
    {
        cout << i << endl;
    }
}