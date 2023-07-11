#include <omp.h>
#include <iostream>
using namespace std;

int main()
{
    int array[20];
    for (int i = 0; i < 20; i++)
    {
        array[i] = i;
        // cout<<array[i]<<endl;
    }
    int sum = 0;
    int sum_partial[4];
#pragma omp parallel num_thread(4) reduction(+ \
                                             : sum)
    {
        sum += array[5 * omp_get_thread_num()];
        sum += array[5 * omp_get_thread_num() + 1];
        sum += array[5 * omp_get_thread_num() + 2];
        sum += array[5 * omp_get_thread_num() + 3];
        sum += array[5 * omp_get_thread_num() + 4];
        sum_partial[omp_get_thread_num()] = sum;
    }
    cout << "Local results are as follows: " << endl;
    for (int i = 0; i < 5; i++)
    {
        cout << "For thread " << i + 1 << " the partial sum is " << sum_partial[i] << "." << endl;
    }
    cout << "The final sum of the array is : " << sum << endl;
    return 0;
}